unit Duck;

interface

uses Classes, Observable, Interfaces;

type

  TQuackConter = class(TInterfacedObject, IQuackable)
  strict private
    FDuck: IQuackable;
    class var FNumberOfQuack: Integer;
  public
    constructor Create(aDuck: IQuackable);
    class property NumberOfQuack: Integer read FNumberOfQuack write FNumberOfQuack;

    procedure quack();
    procedure registerObserver(aObserver: IObserver);
    procedure notifyObservers();
  end;

  TDuck = class(TInterfacedObject, IQuackObservable)
  strict private
    FObservable: TObservable;
  public
    constructor Create();
    procedure quack(); virtual; abstract;
    procedure registerObserver(aObservable: IObserver);
    procedure notifyObservers();
  end;

  TMalardDuck = class(TDuck, IQuackable)
    procedure quack(); override;
  end;

  TRedheadDuck = class(TDuck, IQuackable)
    procedure quack(); override;
  end;

  TDuckCall = class(TDuck, IQuackable)
    procedure quack(); override;
  end;

  TRubberDuck = class(TDuck, IQuackable)
    procedure quack(); override;
  end;

implementation

{ TMalardDuck }

procedure TMalardDuck.quack;
begin
  Writeln('Quack');
  notifyObservers();
end;

{ TRedheadDuck }

procedure TRedheadDuck.quack;
begin
  Writeln('Quack');
  notifyObservers()
end;

{ TDuckCall }

procedure TDuckCall.quack;
begin
  Writeln('Kwak');
  notifyObservers()
end;

{ TRubberDuck }

procedure TRubberDuck.quack;
begin
  Writeln('Squeak');
  notifyObservers()
end;

{ TQuackConter }

constructor TQuackConter.Create(aDuck: IQuackable);
begin
  FDuck := aDuck;
end;

procedure TQuackConter.notifyObservers;
begin
  FDuck.notifyObservers();
end;

procedure TQuackConter.quack;
begin
  FDuck.quack;
  Inc(FNumberOfQuack);
end;

procedure TQuackConter.registerObserver(aObserver: IObserver);
begin
  FDuck.registerObserver(aObserver);
end;

{ TDuck }

constructor TDuck.Create;
begin
  FObservable := TObservable.Create(Self);
end;

procedure TDuck.notifyObservers;
begin
  FObservable.notifyObservers();
end;

procedure TDuck.registerObserver(aObservable: IObserver);
begin
  FObservable.registerObserver(aObservable);
end;

end.
