import Order from "./order";
import TotalOrder from "./total-order";

export default function TempleteOrder({ children, orders }) {
  return (
    <>
      <div className="row">
        <div className="col-8">{children}</div>
        <div className="col-4">
          <Order orders={orders} />
          <TotalOrder orders={orders} />
        </div>
      </div>
    </>
  );
}
