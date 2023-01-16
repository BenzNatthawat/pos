// add bootstrap css
import "bootstrap/dist/css/bootstrap.css";
// own css files here
import "../styles/customscss.scss";

import Head from "next/head";

export default function App({ Component, pageProps }) {
  return (
    <>
      <Head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>
      <Component {...pageProps} />
    </>
  );
}
