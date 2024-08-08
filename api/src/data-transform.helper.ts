import { TransformFnParams } from 'class-transformer';

export function toFrenchDateFormat({ value }: TransformFnParams) {
  if (!value) return value;

  const date = new Date(value);
  const day = date.getDate().toString().padStart(2, '0');
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const year = date.getFullYear();

  return `${day}/${month}/${year}`;
}
