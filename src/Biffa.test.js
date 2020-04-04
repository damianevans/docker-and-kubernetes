import React from 'react';
import { render } from '@testing-library/react';
import Biffa from './Biffa';

test('renders Biffa quote', () => {
  const { getByText } = render(<Biffa />);
  const linkElement = getByText(/Are yers callin' us a heemasex like/i);
  expect(linkElement).toBeInTheDocument();
});
