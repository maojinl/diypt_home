using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PrizeErrorCode
/// </summary>
public class PrizeErrorCode
{
    public const int ERROR_NOT_LOGGED_IN = -1;
    public const int ERROR_EXIST_PLAN = -2;
    public const int ERROR_WRONG_PROGRAM = -3;
    public const int ERROR_WRONG_LOCATION = -4;
    public const int ERROR_WRONG_LEVEL = -5;
    public const int ERROR_WRONG_EXP = -6;
    public const int ERROR_PLAN_NOT_EXIST = -7;

    public PrizeErrorCode()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    static public string getErrorMessage(int errorCode)
    {
        switch (errorCode)
        {
            case ERROR_NOT_LOGGED_IN:
                return "Not Logged In.";
            case ERROR_EXIST_PLAN:
                return "You got existing exercise plan.";
            case ERROR_WRONG_PROGRAM:
                return "Wrong program.";
            case ERROR_WRONG_LOCATION:
                return "Wrong location.";
            case ERROR_WRONG_LEVEL:
                return "Wrong level.";
            case ERROR_WRONG_EXP:
                return "Wrong experience.";
            case ERROR_PLAN_NOT_EXIST:
                return "No such plan.";
            default:
                return "Error!";
        } 
    }
}