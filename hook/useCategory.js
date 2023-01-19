import { useState } from "react";

export const useCategory = () => {
  const [category, setCategory] = useState('');

  const handleCategory = (d) => {
    setCategory(d)
  };

  return { category, setCategory, handleCategory };
};
