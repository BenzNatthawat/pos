import mongoose from "mongoose";

const BillSchema = new mongoose.Schema(
  {
    table: {
      type: String,
      required: true,
    },
    customer: {
      type: Number,
      required: true,
    },
    discount: {
      type: Number,
      required: true,
    },
    status: {
      type: String,
      enum: ["wait", "pay", "cancel"],
      default: "wait",
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

let Bill;

try {
  // Try to get the existing model to prevent recompiling
  Bill = mongoose.model("Bill");
} catch (e) {
  // If the model doesn't exist, create and export it
  Bill = mongoose.model("Bill", BillSchema);
}

export default Bill;
