trigger ProgramName on Contact (before insert, before update){
    Set<Id> ptr = new Set<Id>();
    for(Contact i : Trigger.New){
        ptr.add(i.Current_Program__c);
    }
    Map<Id, Program__c> names = new Map<Id,Program__c>([
        SELECT Id, name
        FROM Program__c]);

    for(Contact con : Trigger.New){
        con.Current_Program_Name__c = names.get(con.Current_Program__c).name;
    }
}