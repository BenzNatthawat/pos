import nextConnect from 'next-connect';

import DatabaseMiddleware from '../../lib/db';
// import APIAuth from '../../../../src/APIAuth';

const handler = nextConnect();

handler.use(DatabaseMiddleware);
// handler.use(APIAuth);

/* Get device detail */
handler.get(async (req, res) => {
    const deviceId = req.query.id;

    let devices = await req.dbClient.query(
        "SELECT * FROM general.devices WHERE id = $1 LIMIT 1;", 
        [ 
            deviceId
        ]
    );

    devices = devices.rows[0];

    res.status(200).json(devices);
});

/* Update device */
handler.put(async (req, res) => {
    const deviceId = req.query.id;

    const deviceInfo = Object.assign(
        { }, 
        req.body
    );

    let fieldUpdate = [ ];

    for (const fieldName of [
        "name",
        "description",
        "eui",
        "alert"
    ]) {
        if (typeof deviceInfo[fieldName] !== "undefined") {
            fieldUpdate.push({ 
                field: fieldName,
                value: typeof deviceInfo[fieldName] !== "object" ? deviceInfo[fieldName] : JSON.stringify(deviceInfo[fieldName])
            });
        }
    }

    let updateDeviceInfo = await req.dbClient.query(
        `UPDATE general.devices SET ${fieldUpdate.map((item, index) => item.field + " = $" + (index + 1)).join(", ")} WHERE id = $${fieldUpdate.length + 1};`,
        fieldUpdate.map(item => item.value).concat([ deviceId ])
    );

    return res.status(200).json("OK");
});

/* Delete device */
handler.delete(async (req, res) => {
    const deviceId = req.query.id;

    let deleteDeviceInfo = await req.dbClient.query(
        "DELETE FROM general.devices WHERE id = $1;",
        [
            deviceId,
        ]
    );

    return res.status(200).json("OK");
});

export default handler;