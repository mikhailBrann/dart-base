/**
mixin  предназначен на внедрение какого то функционала вне зависимости от класса и его реализации,
так же mixin могут хранить значения в переменных
 */


void main() {
    final iphone = Phone();
    final ipad = Tablet();

    iphone.enabledWifi();

    print(iphone.enabled);
    print(ipad.enabled);
}

mixin Wifi {
    //mixin могут хранить значения в переменных, которые доступны в классах которые используют mixin
    bool enabled = false;

    void enabledWifi() {
        enabled = true;
        print('WIFI on');
    }

    void disabledWifi() {
        enabled = false;
        print('WIFI off');
    }
}

class Phone with Wifi {}
class Tablet with Wifi {}