import mongoose from "mongoose";

const TableSchema = new mongoose.Schema(
  {
    table: {
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

let Table;

try {
  // Try to get the existing model to prevent recompiling
  Table = mongoose.model("Table");
} catch (e) {
  // If the model doesn't exist, create and export it
  Table = mongoose.model("Table", TableSchema);
}

export default Table;
