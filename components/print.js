import dayjs from "dayjs";
import { useRef } from "react";
import ReactDOMServer from "react-dom/server";

export default function Print({ orders }) {
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
        <table style={{ fontSize: "0.8rem" }}>
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

          <tr style={{ fontWeight: 600, fontSize: "1rem" }}>
            <td colSpan="2">Amount</td>
            <td className="text-end">
              {orders.reduce(
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
      <button type="button" className="btn btn-primary" onClick={printContent}>
        <i class="bi bi-printer-fill"></i>print
      </button>
      <iframe
        ref={iframeRef}
        style={{ display: "none" }}
        title="Print Content"
        srcDoc={htmlString}
      ></iframe>
    </>
  );
}
