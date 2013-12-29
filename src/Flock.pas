unit Flock;

interface

uses Classes, Generics.Collections, Interfaces;

type
  TQuackableList = TList<IQuackable>;

  TFlock = class(TInterfacedObject, IQuackable)
  strict private
    FQuackers: TQuackableList;
  public
    constructor Create();
    procedure add(aQuacker: IQuackable);
    procedure quack();

    procedure registerObserver(aObserver: IObserver);
    procedure notifyObservers();
  end;

implementation

{ TFlock }

procedure TFlock.add(aQuacker: IQuackable);
begin
  FQuackers.add(aQuacker);
end;

constructor TFlock.Create;
begin
  FQuackers := TQuackableList.Create;
end;

procedure TFlock.notifyObservers;
begin
  { пустая реализация: каждая IQuackable сама оповещает наблюдателя. }
end;

procedure TFlock.quack;
var
  quacker: IQuackable;
begin
  for quacker in FQuackers do
    quacker.quack;
end;

procedure TFlock.registerObserver(aObserver: IObserver);
var
  quacker: IQuackable;
begin
  for quacker in FQuackers do
    quacker.registerObserver(aObserver);
end;

end.
