# --
# Kernel/Language/pt_BR_GeneralCatalog.pm - translation file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: pt_BR_GeneralCatalog.pm,v 1.7 2011/11/24 15:22:10 ub Exp $
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
    $Self->{Translation}->{'General Catalog Management'} = 'Gerenciamento do Catálogo Geral';
    $Self->{Translation}->{'Add Catalog Item'} = 'Adicionar Item ao Catálogo';
    $Self->{Translation}->{'Add Catalog Class'} = 'Adicionar Classe ao Catálogo';
    $Self->{Translation}->{'Catalog Class'} = 'Classe do Catálogo';

    # SysConfig
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Criar e gerenciar o Catálogo Geral.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} = 'Módulo de registo da interface para a configuração AdminGeneralCatalog na área administrativa.';
    $Self->{Translation}->{'General Catalog'} = 'Catálogo Geral';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} = 'Parâmetros para o comentário de exemplo 2 dos atributos do catálogo geral.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} = 'Parâmetros para os grupos de permissão de exemplo dos atributos do catálogo geral.';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'A Catalog Class should have a Name!'} = 'Uma Classe de Catálogo deve ter um nome!';
    $Self->{Translation}->{'A Catalog Class should have a description!'} = 'Uma Classe de Catálogo deve ter uma descrição!';
    $Self->{Translation}->{'Catalog Class is required.'} = 'A Classe de Catálogo é obrigatória.';
    $Self->{Translation}->{'Name is required.'} = 'O nome é obrigatório.';

}

1;
