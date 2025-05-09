// src/components/Greet.tsx
type Props = { name: string };
export default function Greet({ name }: Props) {
  return <h1>Hello, {name}</h1>;
}
