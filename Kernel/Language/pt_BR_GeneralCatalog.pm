# --
# Kernel/Language/pt_BR_GeneralCatalog.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: pt_BR_GeneralCatalog.pm,v 1.6 2011/05/12 11:48:42 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_GeneralCatalog;

use strict;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funcionalidade';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Gerenciamento do Cat�logo Geral';
    $Self->{Translation}->{'Add Catalog Item'} = 'Adicionar Item ao Cat�logo';
    $Self->{Translation}->{'Add Catalog Class'} = 'Adicionar Classe ao Cat�logo';
    $Self->{Translation}->{'Catalog Class'} = 'Classe do Cat�logo';

    # SysConfig
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Criar e gerenciar o Cat�logo Geral.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} = 'M�dulo de registo da interface para a configura��o AdminGeneralCatalog na �rea administrativa.';
    $Self->{Translation}->{'General Catalog'} = 'Cat�logo Geral';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} = 'Par�metros para o coment�rio de exemplo 2 dos atributos do cat�logo geral.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = 'Par�metros para os grupos de permiss�o de exemplo dos atributos do cat�logo geral.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'A Catalog Class should have a Name!'} = 'Uma Classe de Cat�logo deve ter um nome!';
    $Self->{Translation}->{'A Catalog Class should have a description!'} = 'Uma Classe de Cat�logo deve ter uma descri��o!';
    $Self->{Translation}->{'Catalog Class is required.'} = 'A Classe de Cat�logo � obrigat�ria.';
    $Self->{Translation}->{'Name is required.'} = 'O nome � obrigat�rio.';

}

1;
