import Order from "./order";
import Payment from "./payment";
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
          <div className="row">
            <div className="col-12">
              <div className="btn-group btn-group-toggle overflow-y-scroll w-inherit" data-toggle="buttons">
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
            </div>
            <div className="col-12">
              {children}
            </div>
          </div>
        </div>
        <div className="col-4">
          <Order orders={orders} />
          <TotalOrder orders={orders} />
          <Print orders={orders} />
          <Payment orders={orders} />
        </div>
      </div>
    </div>
  );
}
