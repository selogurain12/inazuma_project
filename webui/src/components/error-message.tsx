interface Props {
    message: string | undefined;
  }
  export function ModalErrorMessage({ message }: Props) {
    return <span className="text-red-700 text-sm text-right">{message}</span>;
  }
  