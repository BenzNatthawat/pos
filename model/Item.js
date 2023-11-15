import { ObjectId } from "mongodb";
import mongoose from "mongoose";

const ItemSchema = new mongoose.Schema(
  {
    th: {
      type: String,
      required: true,
    },
    en: {
      type: String,
    },
    rus: {
      type: String,
    },
    price: {
      type: Number,
      required: true,
    },
    category_id: {
      type: ObjectId,
      required: true,
    },
    created_at: {
      type: Date,
      default: Date.now,
    },
    updated_at: {
      type: Date,
      default: Date.now,
    },
  },
  { timestamps: { createdAt: "created_at", updatedAt: "updated_at" } }
);

let Item;

try {
  // Try to get the existing model to prevent recompiling
  Item = mongoose.model("Item");
} catch (e) {
  // If the model doesn't exist, create and export it
  Item = mongoose.model("Item", ItemSchema);
}

export default Item;
