import mongoose from "mongoose";

const OrderSchema = new mongoose.Schema(
  {
    item_id: {
      type: String,
      required: true,
    },
    bill_id: {
      type: String,
      required: true,
    },
    amount: {
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

let Order;

try {
  // Try to get the existing model to prevent recompiling
  Order = mongoose.model("Order");
} catch (e) {
  // If the model doesn't exist, create and export it
  Order = mongoose.model("Order", OrderSchema);
}

export default Order;
