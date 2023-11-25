import { useState } from "react";
import dayjs from "dayjs";
import { useRef } from "react";
import ReactDOMServer from "react-dom/server";

export default function Payment({ orders }) {
  const [showModal, setShowModal] = useState(false);
  const [cash, setCash] = useState(0);

  const openPaymentModal = () => {
    if (orders.length > 0) {
      setShowModal(true);
    }
  };

  const closeModal = () => {
    setShowModal(false);
  };

  const handleCash = (cash) => {
    setCash(pre => pre + cash)
  };

  const iframeRef = useRef(null);
  var html = (
    <html>
      <head>
        <style>
          {`
            tr td:nth-child(2) {
                width: 35px;
                max-width: 100px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            tr td:nth-child(3) {
                text-align: end;
            }
            .text-end {
                text-align: end;
            }
        `}
        </style>
      </head>
      <body>
        <table style={{ fontSize: "0.6rem" }}>
          <tr style={{ textAlign: "center" }}>
            <td colSpan="3">
              <img src="/images/logo-bill.jpg" width="100" />
            </td>
          </tr>

          <tr style={{ textAlign: "center" }}>
            <td colSpan="3">- - - - - - - - - - - - - - - - - - - -</td>
          </tr>

          <tr>
            <td colSpan="3" style={{ textAlign: "center", fontSize: "0.6rem" }}>
              bill id: 2023-001
            </td>
          </tr>

          <tr>
            <td colSpan="3" style={{ textAlign: "center", fontSize: "0.6rem" }}>
              Table: 5
            </td>
          </tr>

          <tr>
            <td colSpan="3" style={{ textAlign: "center", fontSize: "0.6rem" }}>
              Date: {dayjs().format("DD/MM/YYYY HH:mm")}
            </td>
          </tr>

          <tr>
            <td colSpan="3" style={{ textAlign: "center", fontSize: "0.6rem" }}>
              Call Delivery: 081-894-2289{" "}
            </td>
          </tr>

          <tr style={{ textAlign: "center" }}>
            <td colSpan="3">- - - - - - - - - - - - - - - - - - - -</td>
          </tr>

          <tr>
            <td>Qty</td>
            <td>Product</td>
            <td>Total</td>
          </tr>

          <tr style={{ textAlign: "center" }}>
            <td colSpan=" 3">- - - - - - - - - - - - - - - - - - - -</td>
          </tr>

          {orders.map((order, index) => {
            return (
              <tr key={index}>
                <td>{order?.amount}</td>
                <td>{order?.en}</td>
                <td>{order?.price * order?.amount}</td>
              </tr>
            );
          })}

          <tr style={{ textAlign: "center" }}>
            <td colSpan="3">- - - - - - - - - - - - - - - - - - - -</td>
          </tr>

          <tr>
            <td colSpan="2">Amount</td>
            <td className="text-end">
              {orders.reduce(
                (sum, order) => sum + order.price * order.amount,
                0
              )}
            </td>
          </tr>

          <tr>
            <td colSpan="2">Cash</td>
            <td className="text-end">
              {cash}
            </td>
          </tr>

          <tr>
            <td colSpan="2">Change</td>
            <td className="text-end">
              {cash - orders.reduce(
                (sum, order) => sum + order.price * order.amount,
                0
              )}
            </td>
          </tr>

          <tr style={{ textAlign: "center" }}>
            <td colSpan="3">- - - - - - - - - - - - - - - - - - - -</td>
          </tr>

          <tr style={{ textAlign: "center" }}>
            <td colSpan="3">***** Thank you *****</td>
          </tr>
          <tr style={{ textAlign: "center" }}>
            <td colSpan="3">- - - - - - - - - - - - - - - - - - - -</td>
          </tr>
        </table>
      </body>
    </html>
  );
  const htmlString = ReactDOMServer.renderToString(html);

  const printContent = () => {
    if (iframeRef.current) {
      const iframe = iframeRef.current;
      const iframeContent = iframe.contentWindow;

      if (iframeContent) {
        iframeContent.print(); // Triggers printing of iframe content
      }
    }
  };

  return (
    <>
      <button
        type="button"
        className="btn btn-primary"
        onClick={openPaymentModal}
        disabled={orders.length <= 0}
      >
        <i className="bi bi-cash-coin"></i> ชำระเงิน
      </button>

      <div className={`modal ${showModal ? 'show' : ''}`} id="exampleModalCenter" tabIndex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden={!showModal}>
        <div cla="modal-dialog modal-dialog-centered" role="document">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title" id="exampleModalLongTitle">ชำระเงิน</h5>
              <button type="button" className="btn-close" aria-label="Close" onClick={closeModal}></button>
            </div>
            <div className="modal-body">
              <button type="button" className="btn btn-light" onClick={() => handleCash(1000)}>1000</button>
              <button type="button" className="btn btn-light" onClick={() => handleCash(500)}>500</button>
              <button type="button" className="btn btn-light" onClick={() => handleCash(100)}>100</button>

              ยอดชำระ {orders.reduce(
                (sum, order) => sum + order.price * order.amount,
                0
              )}
              เงิน {cash}
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" onClick={closeModal}>ปิด</button>
              <button type="button" className="btn btn-primary" onClick={printContent}>ชำระเงิน</button>
            </div>
          </div>
        </div>
      </div>

      <iframe
        ref={iframeRef}
        style={{ display: "none" }}
        title="Print Content"
        srcDoc={htmlString}
      ></iframe>
    </>
  );
}
