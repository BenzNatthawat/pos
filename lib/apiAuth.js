import Cookies from 'cookies';
import jwt from 'jsonwebtoken';
import { dbClient } from './db';

export default async function APIAuth(req, res, next) {
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

        req.user = user;
        req.userInfo = user;

        return next();
    } catch(e) {
        return res.status(401).send("unauthorized");
    }
};
