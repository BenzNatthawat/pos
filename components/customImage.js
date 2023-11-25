import Image from "next/image";
import { useState } from "react";

export default function CustomImage({ src, alt, ...props }) {
  const [error, setError] = useState(false);

  const handleError = () => {
    setError(true);
  };

  return (
    <>
      {error ? (
        <Image src={`/images/image-error.jpg`} alt={alt} {...props} />
      ) : (
        <Image src={src} alt={alt} onError={handleError} {...props} />
      )}
    </>
  );
}
