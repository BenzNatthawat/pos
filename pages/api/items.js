import nextConnect from "next-connect";
import Item from "@/model/Item";
import { connectToDatabase } from "@/utils/db";

const handler = nextConnect();
handler.use(async (req, res, next) => {
  await connectToDatabase();
  next();
});

handler.get(async (req, res) => {
  try {
    const { category, page = 1, limit = 10 } = req.query;
    const query = category
      ? {
          category_id: category,
        }
      : {};
    const data = await Item.find(query)
      .limit(limit)
      .skip(limit * (page - 1));
    res.status(200).json({
      data: data,
      page: page,
      limit: limit,
    });
  } catch (error) {
    res.status(500).json({ message: "Error fetching data" });
  }
});

handler.post(async (req, res) => {
  const data = req.body;
  try {
    const newItem = new Item({ ...data });
    await newItem.save();
    res.status(201).json(newItem);
  } catch (error) {
    res.status(500).json({ message: "Error inserting data" });
  }
});

handler.delete(async (req, res) => {
  const { id } = req.query;

  try {
    const deletedItem = await Item.findByIdAndDelete(id);

    if (!deletedItem) {
      return res.status(404).json({ error: "Item not found" });
    }

    res.status(200).json({ message: "Item deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: "Failed to delete item" });
  }
});

export default handler;
