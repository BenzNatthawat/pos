import Order from "./order";

export default function TempleteOrder({ children }) {
  return (
    <>
      <div className="row">
        <div className="col-8">{children}</div>
        <div className="col-4">
          <Order />
        </div>
      </div>
    </>
  );
}
