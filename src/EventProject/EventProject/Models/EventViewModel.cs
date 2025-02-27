﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventProject.Models
{
    public class EventViewModel
    {
        public EventViewModel (int eventId, string eventName, string eventDesc, 
            DateTime start, DateTime end, string status, bool isInActive)
        {
            this.EventID = eventId;
            this.EventName = eventName;
            this.EventDescription = eventDesc;
            this.EventStartDate = start;
            this.EventEndDate = end;
            this.IsInActive = isInActive;
        }

        public int EventID { get; set; }
        public string EventName { get; set; }
        public string EventDescription { get; set; }
        public string EventAddress { get; set; }
        public DateTime EventStartDate { get; set; }
        public DateTime EventEndDate { get; set; }
        public string Status { get; set; }
        public bool IsInActive { get; set; }
    }
}