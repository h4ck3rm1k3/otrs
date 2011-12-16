# --
# WebserviceConfig.t - WebserviceConfig tests
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: WebserviceConfig.t,v 1.6 2011/04/28 21:35:50 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.
# --

use strict;
use warnings;
use utf8;
use vars (qw($Self));
use Kernel::System::GenericInterface::Webservice;

use YAML;

my $Home = $Self->{ConfigObject}->Get('Home');
my $PathToTest =
    $Home .
    '/scripts/test/sample/GenericInterface/Webservice/';
my $WebserviceConfig =
    $Home . '/bin/otrs.WebserviceConfig.pl';

# workaround for windows
if ( $^O =~ /^mswin/i ) {
    $WebserviceConfig = "\"$^X\" " . $Home . '/bin/otrs.WebserviceConfig.pl';
}

my $RandomNumber = int( rand(1000000) );

my @Tests = (
    {
        Name       => 'test 1',
        ParamsAdd  => "",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 2',
        ParamsAdd  => "-a",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 3',
        ParamsAdd  => "-a write",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 4',
        ParamsAdd  => "-a write -n",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 5',
        ParamsAdd  => "-a write -n namefor",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 6',
        ParamsAdd  => "-a write -n webservice_6 -f",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 7',
        ParamsAdd  => "-a write -n webservice_7 -f ",
        FileAdd    => '/this/isa/false/path/tofile',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 8',
        ParamsAdd  => "-a write -i",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 9',
        ParamsAdd  => "-a write -i notexists",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 10',
        ParamsAdd  => "-a write -i 25 -f",
        FileAdd    => '',
        SuccessAdd => 0,
    },
    {
        Name       => 'test 11',
        ParamsAdd  => "-a write -i 25 -f ",
        FileAdd    => '/this/isa/false/path/tofile',
        SuccessAdd => 0,
    },
    {
        Name          => 'test 12',
        ParamsAdd     => "-a write -n webserviceconfig_1_$RandomNumber -f ",
        FileAdd       => $PathToTest . "webserviceconfig_2.yml",
        SuccessAdd    => 1,
        ParamsRead    => "-a read -n ",
        SuccessRead   => 0,
        ParamsUpdate  => "-a write -n ",
        FileUpdate    => $PathToTest . "webserviceconfig_1.yml",
        SuccessUpdate => 0,
    },
    {
        Name          => 'test 13',
        ParamsAdd     => "-a write -n webserviceconfig_2_$RandomNumber -f ",
        FileAdd       => $PathToTest . "webserviceconfig_1.yml",
        SuccessAdd    => 1,
        ParamsRead    => "-a read -f ",
        SuccessRead   => 0,
        ParamsUpdate  => "-a write -f ",
        FileUpdate    => $PathToTest . "webserviceconfig_2.yml",
        SuccessUpdate => 1,
    },
    {
        Name          => 'test 14',
        ParamsAdd     => "-a write -n webserviceconfig_3_$RandomNumber -f ",
        FileAdd       => $PathToTest . "webserviceconfig_2.yml",
        SuccessAdd    => 1,
        ParamsRead    => "-a read -i ",
        SuccessRead   => 1,
        ParamsUpdate  => "-a write -i ",
        FileUpdate    => $PathToTest . "webserviceconfig_1.yml",
        SuccessUpdate => 0,
    },
    {
        Name          => 'test 15',
        ParamsAdd     => "-a write -n webserviceconfig_4_$RandomNumber -f ",
        FileAdd       => $PathToTest . "webserviceconfig_1.yml",
        SuccessAdd    => 1,
        ParamsRead    => "-a read -i ",
        SuccessRead   => 1,
        ParamsUpdate  => "-a write -f ",
        FileUpdate    => $PathToTest . "webserviceconfig_2.yml",
        SuccessUpdate => 1,
    },
    {
        Name       => 'test 16',
        ParamsAdd  => "-a write -n webserviceconfig_1_$RandomNumber -f ",
        FileAdd    => $PathToTest . "webserviceconfig_1.yml",
        SuccessAdd => 0,
    },
);

my @WebserviceIDs;

for my $Test (@Tests) {

    # add
    my $WebserviceConfigResult
        = `$WebserviceConfig $Test->{ParamsAdd} $Test->{FileAdd}`;

    if ( !$Test->{SuccessAdd} ) {
        $Self->True(
            $?,
            "$Test->{Name} - Add - WebserviceConfig $Test->{ParamsAdd} $Test->{FileAdd}",
        );
        next;
    }
    else {
        my $FileExist = -e $Test->{FileAdd} ? 1 : 0;
        $Self->True(
            $FileExist,
            "$Test->{Name} - File for add - WebserviceConfig $Test->{FileAdd}",
        );
        $Self->False(
            $?,
            "$Test->{Name} - Add - WebserviceConfig $Test->{ParamsAdd} $Test->{FileAdd}",
        );
    }

    # get new WebseviceID
    my $Fragment =
        substr $WebserviceConfigResult, index( $WebserviceConfigResult, 'ID:' );
    my $WebserviceID = substr $Fragment, 3, -3;

    # remember id
    push @WebserviceIDs, $WebserviceID;

    # read
    $WebserviceConfigResult = `$WebserviceConfig $Test->{ParamsRead} $WebserviceID`;
    if ( !$Test->{SuccessRead} ) {
        $Self->False(
            $WebserviceConfigResult,
            "$Test->{Name} - Read - Webservice $Test->{ParamsRead} $WebserviceID",
        );
        next;
    }
    else {
        $Self->True(
            $WebserviceConfigResult,
            "$Test->{Name} - Read - Webservice $Test->{ParamsRead} $WebserviceID",
        );
    }

    # compare result with original file
    my $Content = $Self->{MainObject}->FileRead(
        Location => $Test->{FileAdd},
    );
    my $OriginalContent = eval { YAML::Load( ${$Content} ) };
    my $ResultContent   = eval { YAML::Load($WebserviceConfigResult) };
    $OriginalContent = YAML::Dump($OriginalContent);
    $ResultContent   = YAML::Dump($ResultContent);
    $Self->Is(
        $OriginalContent,
        $ResultContent,
        "$Test->{Name} - Compare original file with result",
    );

    # update config with a modification
    $WebserviceConfigResult
        = `$WebserviceConfig $Test->{ParamsUpdate} $Test->{FileUpdate} -i $WebserviceID`;
    if ( !$Test->{SuccessUpdate} ) {
        $Self->False(
            $WebserviceConfigResult,
            "$Test->{Name} - Update - Webservice $Test->{ParamsUpdate} $Test->{FileUpdate} -i $WebserviceID",
        );
        next;
    }
    else {
        my $FileExist = -e $Test->{FileUpdate} ? 1 : 0;
        $Self->True(
            $FileExist,
            "$Test->{Name} - File for update - WebserviceConfig $Test->{FileUpdate}",
        );
        $Self->True(
            $WebserviceConfigResult,
            "$Test->{Name} - Update - Webservice $Test->{ParamsUpdate} $Test->{FileUpdate} -i $WebserviceID",
        );
    }

    # compare result with original file
    $WebserviceConfigResult = `$WebserviceConfig $Test->{ParamsRead} $WebserviceID`;
    $Content                = $Self->{MainObject}->FileRead(
        Location => $Test->{FileUpdate},
    );
    $OriginalContent = eval { YAML::Load( ${$Content} ) };
    $ResultContent   = eval { YAML::Load($WebserviceConfigResult) };
    $OriginalContent = YAML::Dump($OriginalContent);
    $ResultContent   = YAML::Dump($ResultContent);
    $Self->Is(
        $OriginalContent,
        $ResultContent,
        "$Test->{Name} - Compare update file with result",
    );

}

# List
my @WebserviceMatch;
my @WebserviceList = `$WebserviceConfig -a list`;
my $WebserviceIDsString = join( '|', @WebserviceIDs );
for my $Row (@WebserviceList) {
    my ( $Key, $Value ) = split( ':', $Row );
    if ( $Key =~ /^($WebserviceIDsString)/i ) {
        push @WebserviceMatch, $Key;
    }
}
$Self->True(
    scalar @WebserviceMatch,
    "Webservice List",
);
$Self->Is(
    scalar @WebserviceMatch,
    scalar @WebserviceIDs,
    "Final Test - Webservice List",
);

# delete Webservices
for my $WebserviceID (@WebserviceIDs) {
    my $WebserviceConfigDelete
        = `$WebserviceConfig -a delete -i $WebserviceID`;
    $Self->True(
        $WebserviceConfigDelete,
        "Webservice Delete ID: $WebserviceID",
    );

    $WebserviceConfigDelete
        = `$WebserviceConfig -a delete -i $WebserviceID`;
    $Self->False(
        $WebserviceConfigDelete,
        "Webservice Delete ID: $WebserviceID",
    );
}

1;
