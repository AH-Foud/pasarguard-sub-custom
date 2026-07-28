import type { FC } from 'react';

const FooterContent = () => {
  return null;
};

export const Footer: FC = ({ ...props }) => {
  return (
    <div dir='ltr' className="relative w-full pb-8 pt-6 px-6" {...props}>
      <div className="container mx-auto max-w-7xl flex justify-center">
        <FooterContent />
      </div>
    </div>
  );
};
