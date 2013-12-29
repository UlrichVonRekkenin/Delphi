unit Goose;

interface

uses Classes, Interfaces;

type
  TGoose = class(TPersistent)
    procedure Honk();
  end;

  TGooseAdapter = class(TInterfacedObject, IQuackable)
  strict private
    FGoose: TGoose;
  public
    constructor Create(aGoose: TGoose);
    procedure quack();

    procedure registerObserver(aObservable: IObserver);
    procedure notifyObservers();
  end;

implementation

{ TGoose }

procedure TGoose.Honk;
begin
  Writeln('Honk');
end;

{ TGooseAdapter }

constructor TGooseAdapter.Create(aGoose: TGoose);
begin
  FGoose := aGoose;
end;

procedure TGooseAdapter.notifyObservers;
begin
  { Гуси не интересуют. }
end;

procedure TGooseAdapter.quack;
begin
  FGoose.Honk;
end;

procedure TGooseAdapter.registerObserver(aObservable: IObserver);
begin
  { не интересуемся гусями. }
end;

end.
