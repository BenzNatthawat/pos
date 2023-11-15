import Order from "./order";

export default function TotalOrder({ orders }) {
  return (
    <>
      <div className="row">
        <div className="col-8">รายการทั้งหมด</div>
        <div className="col-4">
          {orders.reduce((sum, order) => sum + order.amount, 0)}
        </div>
      </div>
      <div className="row">
        <div className="col-8">ยอดรวม</div>
        <div className="col-4">
          {orders.reduce((sum, order) => sum + order.price * order.amount, 0)}
        </div>
      </div>
    </>
  );
}
