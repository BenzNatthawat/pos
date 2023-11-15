import Order from "./order";
import Print from "./print";
import TotalOrder from "./total-order";

export default function TempleteOrder({
  children,
  orders,
  category,
  handleActive,
}) {
  return (
    <div className="container">
      <div className="row">
        <div className="col-8">
          <div className="btn-group btn-group-toggle" data-toggle="buttons">
            {category.map((c, index) => {
              return (
                <button
                  key={index}
                  className="btn btn-secondary"
                  onClick={() => handleActive(c._id)}
                >
                  {c?.th}
                </button>
              );
            })}
          </div>
          {children}
        </div>
        <div className="col-4">
          <Order orders={orders} />
          <TotalOrder orders={orders} />
          <Print orders={orders} />
        </div>
      </div>
    </div>
  );
}
