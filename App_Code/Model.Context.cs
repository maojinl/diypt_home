﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class DIYPTEntities : DbContext
{
    public DIYPTEntities()
        : base("name=DIYPTEntities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<PrizePlanProgram> PrizePlanPrograms { get; set; }

    public virtual DbSet<MemberCommunityChat> MemberCommunityChats { get; set; }

    public virtual DbSet<MemberExercisePlan> MemberExercisePlans { get; set; }

    public virtual DbSet<MemberExercisePlanWeek> MemberExercisePlanWeeks { get; set; }

    public virtual DbSet<MemberFoodPlanWeek> MemberFoodPlanWeeks { get; set; }

    public virtual DbSet<MemberPlanWeekResult> MemberPlanWeekResults { get; set; }

    public virtual DbSet<PrizeExerciseDayGroupName> PrizeExerciseDayGroupNames { get; set; }

    public virtual DbSet<PrizeExerciseDayType> PrizeExerciseDayTypes { get; set; }

    public virtual DbSet<PrizeExercisePlan> PrizeExercisePlans { get; set; }

    public virtual DbSet<PrizeExercisePlanWeekDay> PrizeExercisePlanWeekDays { get; set; }

    public virtual DbSet<PrizeExercisePlanWeek> PrizeExercisePlanWeeks { get; set; }

    public virtual DbSet<PrizeExerciseUnit> PrizeExerciseUnits { get; set; }

    public virtual DbSet<PrizeExerciseUnitSetForDay> PrizeExerciseUnitSetForDays { get; set; }

    public virtual DbSet<PrizeExerciseUnitSet> PrizeExerciseUnitSets { get; set; }

    public virtual DbSet<PrizeFoodPlan> PrizeFoodPlans { get; set; }

    public virtual DbSet<PrizeMemberLog> PrizeMemberLogs { get; set; }

    public virtual DbSet<PrizeOrder> PrizeOrders { get; set; }

    public virtual DbSet<PrizePlanExperience> PrizePlanExperiences { get; set; }

    public virtual DbSet<PrizePlanLevel> PrizePlanLevels { get; set; }

    public virtual DbSet<PrizePlanLocation> PrizePlanLocations { get; set; }

    public virtual DbSet<PrizePollingTask> PrizePollingTasks { get; set; }

    public virtual DbSet<PrizeSysConfig> PrizeSysConfigs { get; set; }

    public virtual DbSet<PrizeErrorLog> PrizeErrorLogs { get; set; }

    public virtual DbSet<PrizeMember> PrizeMembers { get; set; }

    public virtual DbSet<MemberEmail> MemberEmails { get; set; }

    public virtual DbSet<PrizePresetTask> PrizePresetTasks { get; set; }

    public virtual DbSet<cmsMember> cmsMembers { get; set; }

    public virtual DbSet<MemberWeeklyPayment> MemberWeeklyPayments { get; set; }

}

