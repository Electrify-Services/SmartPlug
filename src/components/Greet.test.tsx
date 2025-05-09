// src/components/Greet.test.tsx
import { render, screen } from '@testing-library/react';
import Greet from './Greet';

test('renders greeting message', () => {
  render(<Greet name="Alice" />);
  expect(screen.getByText('Hello, Alice')).toBeInTheDocument();
});
