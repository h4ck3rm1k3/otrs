for my $f (1 .. 16)
{
    $Self->{ParamObject}->SetParam( Param => "TicketFreeText$f"  , Value => "SomeText$f");
    $Self->{ParamObject}->SetParam( Param => "TicketFreeKey$f"  , Value => "SomeTextKey$f");
}

for my $f (1 .. 3)
{
    $Self->{ParamObject}->SetParam( Param => "ArticleFreeKey$f"  , Value => "SomeTextKey$f");
    $Self->{ParamObject}->SetParam( Param => "ArticleFreeText$f"  , Value => "SomeTex$f");

}

for my $f (1 .. 6)
{
    $Self->{ParamObject}->SetParam( Param => "TicketFreeTime$f"  , Value => "2011-01-01 12:0${f}:00");
}
