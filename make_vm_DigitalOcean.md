<h1 align="center">Як розгортати віртуальні машини на Digital Ocean</h1>

<br/>

**ВАЖЛИВО!** Нижче наведено пункти, за допомогою яких Ви можете розвернути віртуальні машини на Digital Ocean. Проте пам'ятайте, що за DDoS-атаки акаунти можуть банити, тому, якщо у Вас уже є акаунт на Digital Ocean, для цих цілей раджу Вам створити новий. Усе, що Вам потрібно - пошта й віртуальна картка (а їх можна зробити безліч навіть за кілька хвилин). Забанили акаунт - робимо новий і вперед ;)

<br/>

1. Переходимо за [цим посиланням](https://www.digitalocean.com/). Або можна використати [ось це](https://www.digitalocean.com/try/free-trial-offer?utm_campaign=emea_brand_kw_en_cpc&utm_adgroup=digitalocean_credit_exact&_keyword=digitalocean%20promo%20code&_device=c&_adposition=&utm_content=conversion&utm_medium=cpc&utm_source=google&gclid=CjwKCAjw_tWRBhAwEiwALxFPoVDd0Hf4gWRu_LpvHetaMH-ngZMQDnBquNqMCuo-CRWFkGztRCiFLBoCyykQAvD_BwE), щоб одразу отримати 100$ вільного використання на 60 днів (тоді пропускаємо пункти 6 та 7)

2. Реєструємося за допомогою будь-якого способу (найлегше за допомогою вже існуючого Google акаунту)

3. Тоді Ви отримаєте таке повідомлення. Обираємо `Add a Card`

<p align="center">
  <img src="/images/DigitalOcean/payment_method.png?raw=true" />
</p>

4. Далі вводимо всі реквізити картки. Ім'я й адресу можете вводити рандомні. Тут найкраще створити віртуальну картку в Приват Банку. На картці має бути 5$, які DigitalOcean візьме для перевірки картки й згодом поверне. Далі можете вивести ці кошти й залишити картку просто із 0 балансом (краще так перестрахуватися, ніж потім DigitalOcean "з'їсть" деякі кошти із Вашої основної картки). [Посилання на те, як відкрити віртуальну картку](https://privatbank.ua/digital-card)

5. Усе готово, Ви зареєстовані й добавили віртуальну картку. Далі Ви отримаєте таке вікно. Обираємо `Deploy a virtual machine`

<p align="center">
  <img src="/images/DigitalOcean/deploy_vm.png?raw=true" />
</p>

6. Далі зліва на панелі шукаємо `Billing` і переходимо туди

<p align="center">
  <img src="/images/DigitalOcean/billing.png?raw=true" />
</p>

7. Гортаємо вниз і в полі Promo code вводимо промокод `SAMMY60DAY` (нам дадуть безкоштовних 100$ на наші потреби на 60 днів)

<p align="center">
  <img src="/images/DigitalOcean/promocode.png?raw=true" />
</p>

8. Переходимо на вкладку Droplets. Натискаємо Create Droplet. Далі перші два параметри залишаємо дефолтними. Третій вибираємо згідно Ваших потреб. Раджу брати `Premium Intel with NVMe SSD` за 24$ на місяць. Якщо потрібна потужніша машина - беріть за 48$ (але дивіться за тим, щоб вона працювала не постійно, бо просто Ваш весь бонус у 100$ швидко згорить). Якщо можна й обійтися із меншими ресурсами, то беріть дешевшу

<p align="center">
  <img src="/images/DigitalOcean/droplet.png?raw=true" />
</p>

9. Далі обираємо країну. Вибирайте на свій смак, але якщо створюєте кілька Droplets на одному акаунті, то для кожного наступного Droplet вибирайте іншу локацію (так у Вас будуть віртуальні машини в різних країнах, а відповідно й IP-адреси із різних країн)

<p align="center">
  <img src="/images/DigitalOcean/droplet_country.png?raw=true" />
</p>

10. Далі в Authentication обираємо Password і придумаємо пароль відповідно до правил

<p align="center">
  <img src="/images/DigitalOcean/droplet_password.png?raw=true" />
</p>

11. Далі все залишаємо дефолтним і нічого не змінюємо. Натискаємо Create Droplet. І потрібно трохи зачекати.

12. Вітаю! Віртуальна машина створена! Щоб перейти всередину, просто натискаємо на неї

<p align="center">
  <img src="/images/DigitalOcean/droplet_entry.png?raw=true" />
</p>

13. Далі, щоб відкрити консоль і почати працювати із нею, натискаємо справа вверху на Console

<p align="center">
  <img src="/images/DigitalOcean/droplet_open.png?raw=true" />
</p>

14. Консоль відкриється в новому вікні

<p align="center">
  <img src="/images/DigitalOcean/console.png?raw=true" />
</p>

15. Вітаю! Усе повністю готове до роботи. Таких віртуальних машин на одному акаунті можна робити безліч і відкривати коснолі також можна безліч одночасно (звісно, у межах розумного, щоб у Вас залишалися кошти ;) ). Щоб зробити нові віртуальні машини просто повторюйте пункти 8-13

16. Далі в консолі кожної із віртуальних машин можете встановлювати необхідний софт, запускати скрипти із атаками й тд.

17. **Застереження!** Якщо Ви закічнили атаку й розумієте, що будете атакувати ще не скоро (лягаєте спати, ідете по справах і тд), тоді видаляйте всі Droplets, потім заново створюйте й качайте необхідний софт. Так будуть економитися ті 100$, які ми отримали по промокоду. Щоб зробити це, перейдіть у вкладку Droplets, далі на More і тоді Desrtoy

<p align="center">
  <img src="/images/DigitalOcean/destroy.png?raw=true" />
</p>

18. Далі переходьте за [цим посиланням](https://github.com/SlavaUkraineSince1991/DDoS-for-all/blob/main/MHDDoS_proxy.md), щоб дізнатися як проводити атаки на цих віртуальних машинах

<br/>

Ось і все. Якщо виникають будь-які питання, пишіть їх у коментарях під постами в [цьому Телеграм-каналі](https://t.me/ddos_for_all).

**Вдалого бомбардування рашистських сайтів! Слава Україні!**

<p align="center">
  <img src="/images/slava_ukraine.jpg?raw=true" />
</p>

<br/>
<br/>
<br/>

Гайд підготовлений командою **DDOS Tutorial for all**. [Посилання на Телеграм-канал](https://t.me/ddos_for_all)
