import { useState } from "react";

export const useOrders = () => {
  const [orders, setOrders] = useState([]);

  const handleAddOrders = (d) => {
    const order = orders;
    const orderIndex = order.findIndex((o) => o._id === d._id);
    if (orderIndex < 0) {
      order.push({
        ...d,
        amount: 1,
      });
    } else {
      order[orderIndex].amount = order[orderIndex].amount + 1;
    }
    setOrders([...order]);
  };

  return { orders, setOrders, handleAddOrders };
};
