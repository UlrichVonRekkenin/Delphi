unit Honk;

interface

uses Classes, Quackable;

type
  TGoose = class(TPersistent)
    procedure Honk();
  end;

  TGooseAdapter = class(TInterfacedObject, IQuackable)
    strict private
    FGoose:TGoose;
    public
    constructor Create(aGoose:TGoose);
    procedure quack();
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

procedure TGooseAdapter.quack;
begin
FGoose.Honk;
end;

end.
