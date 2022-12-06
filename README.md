# Teste técnico para desenvolvedor mobile Flutter

Objetivo do teste: Implementar a consulta da api https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA e exibir os ultimos 30 pregões. 

# :hammer: Funcionalidades do projeto

 - `Funcionalidade 1`: Consulta exibição em lista dos últimos 30 pregões
 - `Funcionalidade 2`: Exibir gráfico dos últimos 30 pregões

# :hammer: Arquitetura e padrões utilizado no teste:

 - `1`: Arquitetura limpa (Clean Arch).
 - `2`: Separação por modulos individuais com injeção de dependências.
 - `3`: Clean Code (SOLID).
 
 # :hammer: Packages utilizdos:
 
 - `1`: GetX (Injeção de dependências, Gerencia de estado).
 - `2`: Dio (Requisições HTTP).
 - `3`: Intl e flutter_localization (Conversão de data e moeda no padrão BR).
 - `4`: fl_chart (Gerar gráfico).

# :hammer: Comandos para executar o aplicativo no emulador:
- `1`: flutter clean
- `2`: flutter pub get
- `3`: flutter run