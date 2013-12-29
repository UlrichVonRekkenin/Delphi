unit Interfaces;

interface

type
  IObserver = interface;

  IQuackObservable = interface
    procedure registerObserver(aObservable: IObserver);
    procedure notifyObservers();
  end;

  IQuackable = interface(IQuackObservable)
    procedure quack();
  end;

  IObserver = interface
    procedure update(aDuck: IQuackObservable);
  end;

implementation

end.
