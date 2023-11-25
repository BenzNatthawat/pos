import CustomImage from "./customImage";

export default function Order({ orders }) {
  return (
    <>
      {orders.map((o, index) => {
        return (
          <div className="card" key={o._id}>
            <div className="card-body">
              <div className="row">
                <div className="col">
                  <div className="order-image">
                    <CustomImage
                      src={`/images/${o?.img}`}
                      layout="fill"
                      objectFit="cover"
                      objectPosition="center"
                      className="image"
                      alt={o?.th}
                    />
                  </div>
                </div>
                <div className="col">
                  <div className="row">
                    <div className="col-12">{o?.th}</div>
                    <div className="col">{o?.amount}</div>
                    <div className="col">{o?.price * o?.amount}</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        );
      })}
    </>
  );
}
