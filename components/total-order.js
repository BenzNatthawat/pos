import Order from "./order";

export default function TotalOrder({ children, orders }) {
  return (
    <>
      <div className="row">
        <div className="col-8">{children}</div>
        <div className="col-4">
        </div>
      </div>
    </>
  );
}
