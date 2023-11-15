import nextConnect from "next-connect";
import { connectToDatabase } from "@/utils/db";
import Table from "@/model/Table";

const handler = nextConnect();
handler.use(async (req, res, next) => {
  await connectToDatabase();
  next();
});

handler.get(async (req, res) => {
  try {
    const data = await Table.find();
    res.status(200).json({
      data: data,
    });
  } catch (error) {
    res.status(500).json({ message: "Error fetching data" });
  }
});

export default handler;
