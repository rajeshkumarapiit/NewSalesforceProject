public class PieChartController {

    public PageReference getValue() {
        time newtiming = Time.newInstance(integer.valueof(selectedTime.substring(0,2)), integer.valueof(selectedTime.substring(3,5)), 0, 0);
        system.debug('newtiming ....'+newtiming);
        system.debug('selectedTime.substring(0,2)....+++'+selectedTime.substring(0,2));
        system.debug('selectedTime.substring(3,4)....+++++'+selectedTime.substring(3,5));
        
        return null;
    }


    public String selectedTime { get; set; }
    public Time selectedNewTime { get; set; }
    public list<selectoption> slotList{get;set;}
    public List<PieWedgeData> getPieData() {
        List<PieWedgeData> data = new List<PieWedgeData>();
        data.add(new PieWedgeData('Jan', 30));
        data.add(new PieWedgeData('Feb', 15));
        data.add(new PieWedgeData('Mar', 10));
        data.add(new PieWedgeData('Apr', 20));
        data.add(new PieWedgeData('May', 20));
        data.add(new PieWedgeData('Jun', 5));
        return data;
    }

    // Wrapper class
    public class PieWedgeData {

        public String name { get; set; }
        public Integer data { get; set; }

        public PieWedgeData(String name, Integer data) {
            this.name = name;
            this.data = data;
        }
    }
    public PieChartController ()
    {
        getAllSlots();
    }
    public void getAllSlots()
    {
        slotList = new list<selectoption>();
        List<PMM_TimeSlots__c> allSlotsList = PMM_TimeSlots__c.getall().values();
        
        for(PMM_TimeSlots__c slot:allSlotsList)
        {
            
            slotList.add(new SelectOption(slot.PMM_Time_Slot__c,slot.name));
        }
        
    }
}