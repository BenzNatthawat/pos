import mongoose from "mongoose";

const CategorySchema = new mongoose.Schema(
  {
    th: {
      type: String,
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

let Category;

try {
  // Try to get the existing model to prevent recompiling
  Category = mongoose.model("Category");
} catch (e) {
  // If the model doesn't exist, create and export it
  Category = mongoose.model("Category", CategorySchema);
}

export default Category;
