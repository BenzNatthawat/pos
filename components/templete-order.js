import Order from "./order";
import TotalOrder from "./total-order";

export default function TempleteOrder({ children, orders, category, handleActive }) {
  return (
    <div class="container">
      <div className="row">
        <div className="col-8">
          <div className="btn-group btn-group-toggle" data-toggle="buttons">
            {category.map((c) => {
              return (
                <button className="btn btn-secondary" onClick={() => handleActive(c.id)}>{c?.name?.th}</button>
              );
            })}
          </div>
          {children}
        </div>
        <div className="col-4">
          <Order orders={orders} />
          <TotalOrder orders={orders} />
        </div>
      </div>
    </div>
  );
}
