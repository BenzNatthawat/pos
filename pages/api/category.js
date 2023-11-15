import nextConnect from "next-connect";
import { connectToDatabase } from "@/utils/db";
import Category from "@/model/Category";

const handler = nextConnect();
handler.use(async (req, res, next) => {
  await connectToDatabase();
  next();
});

handler.get(async (req, res) => {
  try {
    const data = await Category.find();
    res.status(200).json({
      data: data,
    });
  } catch (error) {
    res.status(500).json({ message: "Error fetching data" });
  }
});

handler.post(async (req, res) => {
  const data = req.body;
  try {
    const newCategory = new Category({ ...data });
    await newCategory.save();
    res.status(201).json(newCategory);
  } catch (error) {
    res.status(500).json({ message: "Error inserting data" });
  }
});

export default handler;
