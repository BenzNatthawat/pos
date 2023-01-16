import Cookies from 'cookies';
import jwt from 'jsonwebtoken';
import { dbClient } from '../middleware/DatabaseMiddleware';

export default async function ServerSideAuth({ req, res, redirect }) {
    if (typeof redirect === "undefined") {
        redirect = true;
    }

    try {
        const cookies = new Cookies(req, res);
        const token = cookies.get("token");
        if (!token) {
            throw "";
        }

        const jwtPayload = jwt.verify(token, process.env.NEXT_PUBLIC_JWT_SECRET || "VEKIN-THINGS-HUB");
        if (!jwtPayload) {
            throw "";
        }

        let user = await dbClient.query("SELECT * FROM general.users WHERE id = $1 LIMIT 1", [ jwtPayload.id ]);
        if (user.rowCount <= 0) {
            throw "";
        }

        user = user.rows[0];
        delete user.password;

        return user;
    } catch(e) {
        if (redirect) {
            res.statusCode = 302;
            res.setHeader("Location", "/");
        }
        return null;
    }
};
