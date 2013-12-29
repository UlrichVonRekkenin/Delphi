unit Observable;

interface

uses Classes, Generics.Collections, Interfaces;

type
  TObserverList = TList<IObserver>;

  TObservable = class(TInterfacedObject, IQuackObservable)
  strict private
    FObservers: TObserverList;
    FDuck: IQuackObservable;
  public
    constructor Create(aDuck: IQuackObservable);
    procedure registerObserver(aObserver: IObserver);
    procedure notifyObservers();
  end;

implementation

{ TObservable }

constructor TObservable.Create(aDuck: IQuackObservable);
begin
  FObservers := TObserverList.Create;
  FDuck := aDuck;
end;

procedure TObservable.notifyObservers;
var
  observer: IObserver;
begin
  for observer in FObservers do
    observer.update(FDuck);
end;

procedure TObservable.registerObserver(aObserver: IObserver);
begin
  FObservers.Add(aObserver);
end;

end.
