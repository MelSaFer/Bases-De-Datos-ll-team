/****** Object:  Database [db01]    Script Date: 30/4/2023 11:22:14 ******/
CREATE DATABASE [db01]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [db01] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [db01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db01] SET ARITHABORT OFF 
GO
ALTER DATABASE [db01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db01] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [db01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db01] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [db01] SET  MULTI_USER 
GO
ALTER DATABASE [db01] SET ENCRYPTION ON
GO
ALTER DATABASE [db01] SET QUERY_STORE = ON
GO
ALTER DATABASE [db01] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[userId] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[campusId] [int] IDENTITY(1,1) NOT NULL,
	[campusName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[campusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampusXUser]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampusXUser](
	[campusXUserId] [int] IDENTITY(1,1) NOT NULL,
	[campusId] [int] NOT NULL,
	[userId] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[campusXUserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Career]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[careerId] [int] IDENTITY(1,1) NOT NULL,
	[careerName] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[facultyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[careerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareerPlan]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareerPlan](
	[planId] [int] IDENTITY(1,1) NOT NULL,
	[careerId] [int] NOT NULL,
	[creationDate] [date] NOT NULL,
	[activationDate] [date] NOT NULL,
	[endingDate] [date] NOT NULL,
	[statusId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[planId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareerXFile]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareerXFile](
	[careerXFileId] [int] IDENTITY(1,1) NOT NULL,
	[careerId] [int] NOT NULL,
	[fileId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[careerXFileId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareerXUser]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareerXUser](
	[careerXUserId] [int] IDENTITY(1,1) NOT NULL,
	[careerId] [int] NOT NULL,
	[userId] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[careerXUserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseId] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [varchar](50) NOT NULL,
	[facultyId] [int] NOT NULL,
	[credits] [int] NOT NULL,
	[hoursPerWeek] [int] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[periodTypeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEvaluation]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEvaluation](
	[courseEvaluationId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[courseGroupId] [int] NOT NULL,
	[score] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseEvaluationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseGroup]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseGroup](
	[courseGroupId] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NOT NULL,
	[periodId] [int] NOT NULL,
	[professorId] [varchar](32) NOT NULL,
	[maxStudents] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseGroupId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseGroupXFile]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseGroupXFile](
	[courseGroupXFileId] [int] IDENTITY(1,1) NOT NULL,
	[courseGroupId] [int] NOT NULL,
	[fileId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseGroupXFileId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseRequirement]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRequirement](
	[courseRequirementId] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NOT NULL,
	[courseXPlanId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseRequirementId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseXFile]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseXFile](
	[CourseXFileId] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NOT NULL,
	[fileId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseXFileId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseXPlan]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseXPlan](
	[courseXPlanId] [int] IDENTITY(1,1) NOT NULL,
	[planId] [int] NOT NULL,
	[courseId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseXPlanId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Day_]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day_](
	[dayId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dayId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[enrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[periodId] [int] NOT NULL,
	[statusId] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endingDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[enrollmentId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnrollmentStatus]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollmentStatus](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnrollmentXStudent]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollmentXStudent](
	[enrollmentXStudentId] [int] IDENTITY(1,1) NOT NULL,
	[enrollmentTime] [time](7) NOT NULL,
	[userId] [varchar](32) NOT NULL,
	[enrollmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[enrollmentXStudentId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[evaluationId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[deadline] [date] NOT NULL,
	[totalValue] [float] NOT NULL,
	[evaluationTypeId] [int] NOT NULL,
	[courseGroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[evaluationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationType]    Script Date: 30/4/2023 11:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationType](
	[evaluationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[evaluationTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[facultyId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[facultyId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[File_]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File_](
	[fileId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](32) NOT NULL,
	[fileTypeId] [int] NOT NULL,
	[periodId] [int] NOT NULL,
	[creationDate] [date] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fileId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileType]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileType](
	[fileTypeId] [int] IDENTITY(1,1) NOT NULL,
	[fileTypeName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fileTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[evaluationId] [int] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[itemValue] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodStatus]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodStatus](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodType]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodType](
	[periodTypeId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[periodTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanStatus]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanStatus](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professor]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[userId] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessorXFaculty]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorXFaculty](
	[professorXFacultyId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](32) NOT NULL,
	[facultyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[professorXFacultyId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[scheduleId] [int] IDENTITY(1,1) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[finishTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[scheduleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleXCourseGroup]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleXCourseGroup](
	[scheduleXCourseGroupId] [int] IDENTITY(1,1) NOT NULL,
	[scheduleXDayId] [int] NOT NULL,
	[courseGroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[scheduleXCourseGroupId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleXDay]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleXDay](
	[scheduleXDayId] [int] IDENTITY(1,1) NOT NULL,
	[scheduleId] [int] NOT NULL,
	[dayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[scheduleXDayId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolPeriod]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolPeriod](
	[schoolPeriodId] [int] IDENTITY(1,1) NOT NULL,
	[periodTypeId] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[statusId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[schoolPeriodId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[userId] [varchar](32) NOT NULL,
	[isAssistant] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentXCourse]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentXCourse](
	[studentXCourseId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](32) NOT NULL,
	[courseId] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[studentXCourseId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentXItem]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentXItem](
	[StudentXItemId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](32) NOT NULL,
	[itemId] [int] NOT NULL,
	[grade] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentXItemId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentXPlan]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentXPlan](
	[studentXPlanId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](32) NOT NULL,
	[planId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[studentXPlanId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_](
	[userId] [varchar](32) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[birthDate] [date] NOT NULL,
	[email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Version]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[versionId] [int] IDENTITY(1,1) NOT NULL,
	[fileId] [int] NOT NULL,
	[modificationDate] [datetime] NOT NULL,
	[filename] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeeklySchedule]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklySchedule](
	[weeklyScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](32) NOT NULL,
	[courseGroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[weeklyScheduleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User_] ([userId])
GO
ALTER TABLE [dbo].[CampusXUser]  WITH CHECK ADD FOREIGN KEY([campusId])
REFERENCES [dbo].[Campus] ([campusId])
GO
ALTER TABLE [dbo].[CampusXUser]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User_] ([userId])
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD FOREIGN KEY([facultyId])
REFERENCES [dbo].[Faculty] ([facultyId])
GO
ALTER TABLE [dbo].[CareerPlan]  WITH CHECK ADD FOREIGN KEY([careerId])
REFERENCES [dbo].[Career] ([careerId])
GO
ALTER TABLE [dbo].[CareerPlan]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[PlanStatus] ([statusId])
GO
ALTER TABLE [dbo].[CareerXFile]  WITH CHECK ADD FOREIGN KEY([careerId])
REFERENCES [dbo].[Career] ([careerId])
GO
ALTER TABLE [dbo].[CareerXFile]  WITH CHECK ADD FOREIGN KEY([fileId])
REFERENCES [dbo].[File_] ([fileId])
GO
ALTER TABLE [dbo].[CareerXUser]  WITH CHECK ADD FOREIGN KEY([careerId])
REFERENCES [dbo].[Career] ([careerId])
GO
ALTER TABLE [dbo].[CareerXUser]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User_] ([userId])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([facultyId])
REFERENCES [dbo].[Faculty] ([facultyId])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([periodTypeId])
REFERENCES [dbo].[PeriodType] ([periodTypeId])
GO
ALTER TABLE [dbo].[CourseEvaluation]  WITH CHECK ADD FOREIGN KEY([courseGroupId])
REFERENCES [dbo].[CourseGroup] ([courseGroupId])
GO
ALTER TABLE [dbo].[CourseGroup]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[CourseGroup]  WITH CHECK ADD FOREIGN KEY([periodId])
REFERENCES [dbo].[SchoolPeriod] ([schoolPeriodId])
GO
ALTER TABLE [dbo].[CourseGroup]  WITH CHECK ADD FOREIGN KEY([professorId])
REFERENCES [dbo].[Professor] ([userId])
GO
ALTER TABLE [dbo].[CourseGroupXFile]  WITH CHECK ADD FOREIGN KEY([courseGroupId])
REFERENCES [dbo].[CourseGroup] ([courseGroupId])
GO
ALTER TABLE [dbo].[CourseGroupXFile]  WITH CHECK ADD FOREIGN KEY([fileId])
REFERENCES [dbo].[File_] ([fileId])
GO
ALTER TABLE [dbo].[CourseRequirement]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[CourseRequirement]  WITH CHECK ADD FOREIGN KEY([courseXPlanId])
REFERENCES [dbo].[CourseXPlan] ([courseXPlanId])
GO
ALTER TABLE [dbo].[CourseXFile]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[CourseXFile]  WITH CHECK ADD FOREIGN KEY([fileId])
REFERENCES [dbo].[File_] ([fileId])
GO
ALTER TABLE [dbo].[CourseXPlan]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[CourseXPlan]  WITH CHECK ADD FOREIGN KEY([planId])
REFERENCES [dbo].[CareerPlan] ([planId])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([periodId])
REFERENCES [dbo].[SchoolPeriod] ([schoolPeriodId])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[EnrollmentStatus] ([statusId])
GO
ALTER TABLE [dbo].[EnrollmentXStudent]  WITH CHECK ADD FOREIGN KEY([enrollmentId])
REFERENCES [dbo].[Enrollment] ([enrollmentId])
GO
ALTER TABLE [dbo].[EnrollmentXStudent]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Student] ([userId])
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([courseGroupId])
REFERENCES [dbo].[CourseGroup] ([courseGroupId])
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([evaluationTypeId])
REFERENCES [dbo].[EvaluationType] ([evaluationTypeId])
GO
ALTER TABLE [dbo].[File_]  WITH CHECK ADD FOREIGN KEY([fileTypeId])
REFERENCES [dbo].[FileType] ([fileTypeId])
GO
ALTER TABLE [dbo].[File_]  WITH CHECK ADD FOREIGN KEY([periodId])
REFERENCES [dbo].[SchoolPeriod] ([schoolPeriodId])
GO
ALTER TABLE [dbo].[File_]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User_] ([userId])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([evaluationId])
REFERENCES [dbo].[Evaluation] ([evaluationId])
GO
ALTER TABLE [dbo].[Professor]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User_] ([userId])
GO
ALTER TABLE [dbo].[ProfessorXFaculty]  WITH CHECK ADD FOREIGN KEY([facultyId])
REFERENCES [dbo].[Faculty] ([facultyId])
GO
ALTER TABLE [dbo].[ProfessorXFaculty]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Professor] ([userId])
GO
ALTER TABLE [dbo].[ScheduleXCourseGroup]  WITH CHECK ADD FOREIGN KEY([courseGroupId])
REFERENCES [dbo].[CourseGroup] ([courseGroupId])
GO
ALTER TABLE [dbo].[ScheduleXCourseGroup]  WITH CHECK ADD FOREIGN KEY([scheduleXDayId])
REFERENCES [dbo].[ScheduleXDay] ([scheduleXDayId])
GO
ALTER TABLE [dbo].[ScheduleXDay]  WITH CHECK ADD FOREIGN KEY([dayId])
REFERENCES [dbo].[Day_] ([dayId])
GO
ALTER TABLE [dbo].[ScheduleXDay]  WITH CHECK ADD FOREIGN KEY([scheduleId])
REFERENCES [dbo].[Schedule] ([scheduleId])
GO
ALTER TABLE [dbo].[SchoolPeriod]  WITH CHECK ADD FOREIGN KEY([periodTypeId])
REFERENCES [dbo].[PeriodType] ([periodTypeId])
GO
ALTER TABLE [dbo].[SchoolPeriod]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[PeriodStatus] ([statusId])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User_] ([userId])
GO
ALTER TABLE [dbo].[StudentXCourse]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[StudentXCourse]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Student] ([userId])
GO
ALTER TABLE [dbo].[StudentXItem]  WITH CHECK ADD FOREIGN KEY([itemId])
REFERENCES [dbo].[Item] ([itemId])
GO
ALTER TABLE [dbo].[StudentXItem]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Student] ([userId])
GO
ALTER TABLE [dbo].[StudentXPlan]  WITH CHECK ADD FOREIGN KEY([planId])
REFERENCES [dbo].[CareerPlan] ([planId])
GO
ALTER TABLE [dbo].[StudentXPlan]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Student] ([userId])
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD FOREIGN KEY([fileId])
REFERENCES [dbo].[File_] ([fileId])
GO
ALTER TABLE [dbo].[WeeklySchedule]  WITH CHECK ADD FOREIGN KEY([courseGroupId])
REFERENCES [dbo].[CourseGroup] ([courseGroupId])
GO
ALTER TABLE [dbo].[WeeklySchedule]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Student] ([userId])
GO
/****** Object:  StoredProcedure [dbo].[spCreateFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spCreateFile](@userId VARCHAR(32), @filename VARCHAR(15), @fileType VARCHAR(8), @periodId INT, @name VARCHAR(70), @description VARCHAR(100)) AS
BEGIN
    IF @userId IS NULL OR @filename IS NULL OR @fileType IS NULL OR @periodId IS NULL OR @name IS NULL OR @description IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM SchoolPeriod WHERE schoolPeriodId = @periodId)
    BEGIN
        SELECT 'The period does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM FileType WHERE fileTypeName = @fileType)
    BEGIN
        SELECT 'The file type does not exist' AS ExecMessage
        RETURN
    END

    DECLARE @fileTypeId INT
    SET @fileTypeId = (SELECT fileTypeId FROM FileType WHERE fileTypeName = @fileType)

    INSERT INTO File_ (userId, fileTypeId, periodId, creationDate, name, description) VALUES (@userId, @fileTypeId, @periodId, GETDATE(), @name, @description)
    INSERT INTO Version (fileId, modificationDate, filename) VALUES (@@IDENTITY, GETDATE(), @filename)
END
GO
/****** Object:  StoredProcedure [dbo].[spCreateUser_]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------------------
----------------------------------------- CRUD User_ ---------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- CREATE USER
-- Entries: userId, userName, birthDate, email, idCampus, student
-- Description: Creates a new user, if is a student, it also creates a new student
CREATE   PROCEDURE [dbo].[spCreateUser_](@userId VARCHAR(32), @userName VARCHAR(50), @birthDate DATETIME, @email VARCHAR(50), @idCampus INT, @student BIT) AS
BEGIN
    IF @userId IS NULL OR @userName IS NULL OR @birthDate IS NULL OR @email IS NULL OR @idCampus IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user already exists' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Campus WHERE campusId = @idCampus)
    BEGIN
        SELECT 'The campus does not exist' AS ExecMessage
        RETURN
    END

    INSERT INTO User_ (userId, userName, birthDate, email) VALUES (@userId, @userName, @birthDate, @email)
    INSERT INTO CampusXUser (campusId, userId) VALUES (@idCampus, @userId)

    IF @student = 1
    BEGIN
    INSERT INTO Student (userId, isAssistant) VALUES (@userId, 0)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- DELETE
-- ENTRIES: fileId
-- DESCRIPTION: Deletes a file
CREATE   PROCEDURE [dbo].[spDeleteFile](@name VARCHAR(15)) AS
BEGIN
    IF @name IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END

	DECLARE @fileId INT
	SET @fileId = (SELECT fileId FROM Version WHERE Version.filename = @name)

	DECLARE @amount INT
	SET @amount = (SELECT COUNT(*) FROM Version WHERE Version.fileId = @fileId)

	IF @amount > 1
	BEGIN
		DELETE FROM Version WHERE Version.filename = @name
	END
	ELSE
	BEGIN
		DELETE FROM Version WHERE Version.filename = @name
		DELETE FROM File_ WHERE fileId = @fileId
	END
		
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUser_]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- DELETE 
-- Entries: userId
-- Description: Deletes a user
CREATE   PROCEDURE [dbo].[spDeleteUser_](@userId VARCHAR(32)) AS
BEGIN
    BEGIN TRY
        IF @userId IS NULL
        BEGIN
            SELECT 'NULL parameters' AS ExecMessage
            RETURN
        END
        IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
        BEGIN
            SELECT 'The user does not exist' AS ExecMessage
            RETURN
        END

        -- verify if the user is a student/teacher/administrator and delete it
        IF EXISTS(SELECT * FROM Student WHERE userId = @userId)
        BEGIN
            DELETE FROM Student WHERE userId = @userId
        END
        IF EXISTS(SELECT * FROM Teacher WHERE userId = @userId)
        BEGIN
            DELETE FROM Teacher WHERE userId = @userId
        END
        IF EXISTS(SELECT * FROM CampusXUser WHERE userId = @userId)
        BEGIN
            DELETE FROM CampusXUser WHERE userId = @userId
        END
        IF EXISTS(SELECT * FROM Administrator WHERE userId = @userId)
        BEGIN
            DELETE FROM Administrator WHERE userId = @userId
        END

        -- delete the user
        DELETE FROM User_ WHERE userId = @userId

    END TRY
    BEGIN CATCH
        SELECT 'The user can not be deleted' AS ExecMessage
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spEnrollment]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spEnrollment](@userId VARCHAR(32), @courseGroupId INT) AS
BEGIN
    DECLARE @enrollmentSchedule INT, @previousSchoolPeriod INT, @meetsRequirements BIT, @courseId INT, @horarioInicio TIME, @horarioFinal TIME, @timeOfDay INT, @currentTime TIME, @dateOfToday DATETIME, @enrollmentId INT, @periodId INT
    SET @previousSchoolPeriod = 0
    SET @enrollmentSchedule = 0
	SET @meetsRequirements = 0
    SET @dateOfToday = GETDATE()
	SET @timeOfDay = DATEPART(HOUR, @dateOfToday)
	SET @currentTime = (SELECT CONVERT(varchar, GETDATE(), 108))
    SET @enrollmentId = (SELECT TOP 1 Enrollment.enrollmentId FROM Enrollment ORDER BY Enrollment.enrollmentId DESC)
    SET @periodId = (SELECT periodId FROM CourseGroup WHERE courseGroupId = @courseGroupId)

	DECLARE @schoolPeriodId INT
	SET @schoolPeriodId = (SELECT TOP 1 schoolPeriodId FROM SchoolPeriod ORDER BY schoolPeriodId DESC)

    --IF (SELECT periodId FROM Enrollment WHERE @enrollmentId = enrollmentId) != @periodId
    --BEGIN
    --    SELECT 'The enrollment period is not the same as the course group' AS ExecMessage
    --    RETURN
    --END

    IF (SELECT EnrollmentStatus.description FROM EnrollmentStatus INNER JOIN Enrollment ON Enrollment.statusId = EnrollmentStatus.statusId WHERE @schoolPeriodId = periodId) = 'Inactivo'
        OR @dateOfToday < (SELECT Enrollment.startDate FROM Enrollment WHERE @schoolPeriodId = periodId) OR @dateOfToday > (SELECT Enrollment.endingDate FROM Enrollment WHERE @schoolPeriodId = periodId)
    BEGIN
        SELECT 'The date of enrollment period is not today or is closed' AS ExecMessage
        RETURN
    END
    IF @userId IS NULL OR @schoolPeriodId IS NULL OR @courseGroupId IS NULL OR @enrollmentId IS NULL OR @dateOfToday IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM SchoolPeriod WHERE schoolPeriodId = @schoolPeriodId)
    BEGIN
        SELECT 'The school period does not exist' AS ExecMessage
        RETURN
    END
    IF EXISTS(SELECT * FROM WeeklySchedule WHERE userId = @userId AND courseGroupId = @courseGroupId)
    BEGIN
        SELECT 'The user is already enrolled' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM CourseGroup WHERE courseGroupId = @courseGroupId)
    BEGIN
        SELECT 'The course group does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Enrollment WHERE enrollmentId = @enrollmentId)
    BEGIN
        SELECT 'The enrollment does not exist' AS ExecMessage
        RETURN
    END

	-- Validates if student meets all requirements to enroll the course
	SET @courseId =(SELECT courseId FROM CourseGroup WHERE courseGroupId = @courseGroupId)
	EXEC spMeetRequirements @userId, @courseId, @meetsRequirements OUTPUT

    IF @meetsRequirements = 0
    BEGIN
        SELECT 'Student does not meet the needed requirements to enroll this course' AS ExecMessage
        RETURN
    END 

	-- Validates if the schedule of the course group doesnt collide with another group schedule
	SET @horarioInicio = (SELECT startTime 
						  FROM ScheduleXDay 
						  INNER JOIN ScheduleXCourseGroup ON ScheduleXCourseGroup.scheduleXDayId = ScheduleXDay.scheduleXDayId
                          INNER JOIN Schedule ON Schedule.scheduleId = ScheduleXDay.scheduleId
						  INNER JOIN CourseGroup ON CourseGroup.courseGroupId = ScheduleXCourseGroup.courseGroupId
						  WHERE CourseGroup.courseGroupId = @courseGroupId)
	SET @horarioFinal = (SELECT finishTime 
						  FROM ScheduleXDay
						  INNER JOIN ScheduleXCourseGroup ON ScheduleXCourseGroup.scheduleXDayId = ScheduleXDay.scheduleXDayId
                          INNER JOIN Schedule ON Schedule.scheduleId = ScheduleXDay.scheduleId
						  INNER JOIN CourseGroup ON CourseGroup.courseGroupId = ScheduleXCourseGroup.courseGroupId
						  WHERE CourseGroup.courseGroupId = @courseGroupId)

	IF EXISTS (SELECT * FROM WeeklySchedule
				INNER JOIN CourseGroup ON WeeklySchedule.courseGroupId = CourseGroup.courseGroupId
				INNER JOIN ScheduleXCourseGroup ON ScheduleXCourseGroup.courseGroupId = CourseGroup.courseGroupId
                INNER JOIN ScheduleXDay ON ScheduleXDay.scheduleXDayId = ScheduleXCourseGroup.scheduleXDayId
				INNER JOIN Schedule ON Schedule.scheduleId = ScheduleXDay.scheduleId
				WHERE @schoolPeriodId = periodId AND
					  ( @horarioInicio BETWEEN startTime AND finishTime ) OR ( @horarioFinal BETWEEN startTime AND finishTime))
	BEGIN
		SELECT 'The schedule of the selected group collides with the schedule of other group' AS ExecMessage
        RETURN
	END

	-- Validates if student hasn't enrolled the same course in other group
	IF EXISTS (SELECT WeeklySchedule.courseGroupId 
				FROM Student
				INNER JOIN WeeklySchedule ON WeeklySchedule.userId = Student.userId
				INNER JOIN CourseGroup ON CourseGroup.courseGroupId = WeeklySchedule.courseGroupId
				INNER JOIN Course ON CourseGroup.courseId = Course.courseId
				WHERE Course.courseId = @courseId AND @userId = Student.userId)
	BEGIN
		SELECT 'The selected couse has already been enrolled in another group' AS ExecMessage
        RETURN
	END

    -- calculate the last school period of the student
    SET @previousSchoolPeriod = (SELECT TOP(1) schoolPeriodId FROM SchoolPeriod
        INNER JOIN CourseGroup ON SchoolPeriod.schoolPeriodId = CourseGroup.periodId
        INNER JOIN Course ON CourseGroup.courseId = Course.courseId
        INNER JOIN StudentXCourse ON Course.courseId = StudentXCourse.courseId
		INNER JOIN WeeklySchedule ON CourseGroup.courseGroupId = weeklySchedule.courseGroupId
        
        WHERE studentXCourse.userId = @userId 
		AND StudentXCourse.status = 1 ORDER BY schoolPeriodId DESC)

    IF @previousSchoolPeriod IS NULL
    BEGIN
        SET @enrollmentSchedule = 7
    END
    ELSE 
    BEGIN
        EXEC dbo.spEnrollmentTimeSchedule @userId, @previousSchoolPeriod, @enrollmentSchedule OUTPUT
    END

	-- Validates if the student can enroll in the current time (start time of enrollment to finish time of enrollment)
    IF (@timeOfDay < @enrollmentSchedule)-- OR (@timeOfDay > 15)
    BEGIN
        SELECT 'You can not enroll because is not your time to enroll or it has passed.' AS ExecMessage
        RETURN
    END

    INSERT INTO WeeklySchedule (userId, courseGroupId) VALUES (@userId, @courseGroupId)
    EXEC spInsertEnrollmentXStudent @enrollmentId, @schoolPeriodId, @userId, @currentTime
    SELECT 'User enrolled succesfully' AS ExecMessage
END
GO
/****** Object:  StoredProcedure [dbo].[spEnrollmentTimeSchedule]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP ENROLLMENT TIME SCHEDULE
-- ENTRIES: @userId VARCHAR(32), @schoolPeriodId INT, @enrollmentTimeScheduleValue INT OUTPUT
-- Description: This procedure return the enrollment time schedule of a student in a school period
-- The enrollment time change depending of the grade average of the student
CREATE   PROCEDURE [dbo].[spEnrollmentTimeSchedule](@userId VARCHAR(32), @schoolPeriodId INT, @enrollmentTimeScheduleValue INT OUTPUT) AS 
BEGIN
    IF @schoolPeriodId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM SchoolPeriod WHERE schoolPeriodId = @schoolPeriodId)
    BEGIN
        SELECT 'The school period does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    
    DECLARE @gradeAverageValue FLOAT
    EXEC spGetGradeAverage @userId, @schoolPeriodId, @gradeAverageValue OUTPUT
    SET @enrollmentTimeScheduleValue = 0

    IF @gradeAverageValue >= 95
    BEGIN
        SET @enrollmentTimeScheduleValue = 7
    END
    ELSE IF @gradeAverageValue >= 90
    BEGIN
        SET @enrollmentTimeScheduleValue = 8
    END
    ELSE IF @gradeAverageValue >= 85
    BEGIN
        SET @enrollmentTimeScheduleValue = 9
    END
    ELSE IF @gradeAverageValue >= 80
    BEGIN
        SET @enrollmentTimeScheduleValue = 10
    END
    ELSE IF @gradeAverageValue >= 75
    BEGIN
        SET @enrollmentTimeScheduleValue = 11
    END
    ELSE IF @gradeAverageValue >= 70
    BEGIN
        SET @enrollmentTimeScheduleValue = 12
    END

	--SELECT @enrollmentTimeScheduleValue

END
GO
/****** Object:  StoredProcedure [dbo].[spExistsFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spExistsFile](@name VARCHAR(70)) AS
BEGIN

    IF @name IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END

    IF NOT EXISTS(SELECT * FROM File_ WHERE name = @name)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        RETURN
    END

    SELECT 'The file exists' AS ExecMessage
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllVersionsOfFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP GET ALL VERSIONS OF FILE
-- ENTRIES: userId, fileId
-- DESCRIPTION: Gets all the versions of a file
CREATE   PROCEDURE [dbo].[spGetAllVersionsOfFile](@fileId INT) AS
BEGIN
    IF @fileId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    
    IF NOT EXISTS(SELECT * FROM File_ WHERE fileId = @fileId)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        RETURN
    END

    SELECT Version.modificationDate FROM File_ INNER JOIN Version ON File_.fileId = Version.fileId WHERE File_.fileId = @fileId
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCourses]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spGetCourses](@userId VARCHAR(32)) AS
BEGIN
    IF @userId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END

    SELECT CourseGroup.courseGroupId, Course.courseId, courseName, credits, CourseEvaluation.description, score
    FROM Course
    INNER JOIN CourseXPlan ON CourseXPlan.courseId = Course.courseId
    INNER JOIN CareerPlan ON CareerPlan.planId = CourseXPlan.planId
    INNER JOIN CourseGroup ON CourseGroup.courseId = Course.courseId
    INNER JOIN CourseEvaluation ON CourseEvaluation.courseGroupId = CourseGroup.courseGroupId

   WHERE Course.courseId != (SELECT StudentXCourse.courseId FROM StudentXCourse WHERE @userId = StudentXCourse.userId) 
   AND CareerPlan.planId = (SELECT CareerPlan.planId FROM Student INNER JOIN StudentXPlan ON StudentXPlan.userId = Student.userId 
   INNER JOIN CareerPlan ON StudentXPlan.planId = CareerPlan.planId WHERE StudentXPlan.userId = @userId) AND CourseGroup.periodId = (SELECT TOP 1 periodId FROM Enrollment ORDER BY periodId DESC)

END
GO
/****** Object:  StoredProcedure [dbo].[spGetEnrolledCourses]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spGetEnrolledCourses](@userId VARCHAR(32)) AS
BEGIN
	DECLARE @schoolPeriodId INT
	SET @schoolPeriodId = (SELECT TOP 1 schoolPeriodId FROM SchoolPeriod ORDER BY schoolPeriodId DESC)

    IF @userId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END

    SELECT CourseGroup.courseGroupId, Course.courseId, Course.courseName, credits, CourseEvaluation.description, CourseEvaluation.score --, Schedule.startTime, Schedule.finishTime, Day_.name
    FROM Course
    INNER JOIN CourseGroup ON Course.courseId = CourseGroup.courseId
    INNER JOIN WeeklySchedule ON CourseGroup.courseGroupId = WeeklySchedule.courseGroupId
    INNER JOIN SchoolPeriod ON CourseGroup.periodId = SchoolPeriod.schoolPeriodId
	INNER JOIN CourseEvaluation ON CourseEvaluation.courseGroupId = CourseGroup.courseGroupId
	--INNER JOIN ScheduleXCourseGroup ON ScheduleXCourseGroup.courseGroupId = CourseGroup.courseGroupId
	--INNER JOIN ScheduleXDay ON ScheduleXDay.scheduleXDayId = ScheduleXCourseGroup.scheduleXDayId
	--INNER JOIN Schedule ON Schedule.scheduleId = ScheduleXDay.scheduleXDayId
	--INNER JOIN Day_ ON Day_.dayId = ScheduleXDay.dayId
		
    WHERE WeeklySchedule.userId = @userId AND SchoolPeriod.schoolPeriodId = @schoolPeriodId AND CourseEvaluation.courseGroupId = CourseGroup.courseGroupId
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEnrollmentTime]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP GET ENROLLMENT TIME
-- ENTRIES: @userId VARCHAR(32), @schoolPeriodId INT, @enrollmentTime TIME OUTPUT
-- Description: This procedure return the enrollment time of a student
CREATE   PROCEDURE [dbo].[spGetEnrollmentTime](@userId VARCHAR(32)) AS
BEGIN

    -- VERIFY NULL PARAMETERS
    IF @userId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END



    DECLARE @enrollmentId INT, @enrollmentTimeSchedule INT, @previousSchoolPeriod INT 

    SET @enrollmentId = (SELECT TOP 1 Enrollment.enrollmentId FROM Enrollment ORDER BY Enrollment.enrollmentId DESC)

    --IF @enrollmentId IS NULL
    --BEGIN
    --    SELECT 'There is not enrollment available' AS ExecMessage
    --    RETURN
    --END
    --IF (SELECT Enrollment.startDate FROM Enrollment WHERE Enrollment.enrollmentId = @enrollmentId) < GETDATE() 
    --BEGIN
    --    SELECT 'The las enrollment has end' AS ExecMessage
    --    RETURN
    --END
    
    SET @previousSchoolPeriod = (SELECT TOP(1) schoolPeriodId FROM SchoolPeriod
        INNER JOIN CourseGroup ON SchoolPeriod.schoolPeriodId = CourseGroup.periodId
        INNER JOIN Course ON CourseGroup.courseId = Course.courseId
        INNER JOIN StudentXCourse ON Course.courseId = StudentXCourse.courseId
		INNER JOIN WeeklySchedule ON CourseGroup.courseGroupId = weeklySchedule.courseGroupId
        
        WHERE studentXCourse.userId = @userId 
		AND StudentXCourse.status = 1 ORDER BY schoolPeriodId DESC)
    
    IF @previousSchoolPeriod IS NULL
    BEGIN
        SET @enrollmentTimeSchedule = 7
    END
    ELSE
    BEGIN
        EXEC spEnrollmentTimeSchedule @userId, @previousSchoolPeriod, @enrollmentTimeSchedule OUTPUT
    END
   
    SELECT (SELECT Enrollment.startDate FROM Enrollment WHERE Enrollment.enrollmentId = @enrollmentId), @enrollmentTimeSchedule
END
GO
/****** Object:  StoredProcedure [dbo].[spGetFileNameFromVersion]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP GET FILE NAME FROM VERSION
-- ENTRIES: name, modificationDate
-- DESCRIPTION: Gets the filename of a file based on the name and the modification date
CREATE   PROCEDURE [dbo].[spGetFileNameFromVersion](@name VARCHAR(70), @modificationDate DATETIME) AS
BEGIN
    IF @name IS NULL OR @modificationDate IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM File_ WHERE name = @name)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        RETURN
    END

    SELECT Version.filename FROM Version INNER JOIN File_ ON File_.fileId = Version.fileId WHERE File_.name = @name AND File_.fileId = Version.fileId AND Version.modificationDate = @modificationDate
END
GO
/****** Object:  StoredProcedure [dbo].[spGetFileVersions]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------------------
----------------------------------------- FILES SP -----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- SP GET FILE VERSIONS 
-- ENTRIES: name
-- DESCRIPTION: Gets all the versions of a file bases on the name
CREATE   PROCEDURE [dbo].[spGetFileVersions](@name VARCHAR(70)) AS
BEGIN
    IF @name IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM File_ WHERE name = @name)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        RETURN
    END

    SELECT Version.modificationDate FROM Version INNER JOIN File_ ON File_.fileId = Version.fileId WHERE File_.name = @name
END
GO
/****** Object:  StoredProcedure [dbo].[spGetGradeAverage]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------------------
----------------------------------------- ENROLLMENT SP ------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- SP GET GRADE AVERAGE
-- ENTRIES: @userId VARCHAR(32), @schoolPeriodId INT
-- Description: This procedure return the grade average of a student in a school period
CREATE   PROCEDURE [dbo].[spGetGradeAverage](@userId VARCHAR(32), @schoolPeriodId INT, @resultado INT OUTPUT) AS
BEGIN
    DECLARE @sum FLOAT, @courseAmount INT
    SET @sum = 0
	SET @courseAmount = 0

    IF @userId IS NULL OR @schoolPeriodId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        SELECT 0
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        SELECT 0
    END
    IF NOT EXISTS(SELECT * FROM SchoolPeriod WHERE schoolPeriodId = @schoolPeriodId)
    BEGIN
        IF @schoolPeriodId <= 0
        BEGIN
            SELECT 'It is the first school period' AS ExecMessage
            SELECT 100
        END

        SELECT 'The school period does not exist' AS ExecMessage
        SELECT 0
    END

	SET @courseAmount = (SELECT COUNT(CourseGroup.courseGroupId) AS total 
                    FROM Student
                    INNER JOIN WeeklySchedule ON Student.userId = WeeklySchedule.userId
                    INNER JOIN CourseGroup ON CourseGroup.courseGroupId = WeeklySchedule.courseGroupId
                    INNER JOIN SchoolPeriod ON SchoolPeriod.schoolPeriodId = CourseGroup.periodId
                    WHERE Student.userId = @userId AND SchoolPeriod.schoolPeriodId = @schoolPeriodId)

    SET @sum = (SELECT SUM(grade) AS totalSum 
                    FROM Student
                    INNER JOIN WeeklySchedule ON Student.userId = WeeklySchedule.userId
                    INNER JOIN CourseGroup ON CourseGroup.courseGroupId = WeeklySchedule.courseGroupId
                    INNER JOIN SchoolPeriod ON SchoolPeriod.schoolPeriodId = CourseGroup.periodId
                    INNER JOIN Evaluation ON Evaluation.courseGroupId = CourseGroup.courseGroupId
                    INNER JOIN Item ON Item.evaluationId = Evaluation.evaluationId
                    INNER JOIN StudentXItem ON StudentXItem.itemId = Item.itemId AND StudentXItem.userId = Student.userId

                    WHERE Student.userId = @userId AND SchoolPeriod.schoolPeriodId = @schoolPeriodId) 

    SET @resultado = @sum / @courseAmount
	--SELECT @sum / @courseAmount
	
END
GO
/****** Object:  StoredProcedure [dbo].[spGetGradeOfCourse]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP GET GRADE OF A COURSE
-- ENTRIES: userId, courseId
-- DESCRIPTION: Get the grade of a student in a course
CREATE   PROCEDURE [dbo].[spGetGradeOfCourse](@userId VARCHAR(32), @courseId INT) AS
BEGIN
    DECLARE @sum FLOAT
    SET @sum = 0
    
    IF @userId IS NULL OR @courseId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Course WHERE courseId = @courseId)
    BEGIN
        SELECT 'The course does not exist' AS ExecMessage
        RETURN
    END
	IF NOT EXISTS(SELECT * FROM User_ INNER JOIN WeeklySchedule ON User_.userId = WeeklySchedule.userId
		INNER JOIN CourseGroup ON WeeklySchedule.courseGroupId = CourseGroup.courseGroupId
		INNER JOIN Course ON CourseGroup.courseId = Course.courseId
		WHERE User_.userId = @userId
		AND CourseGroup.courseId = @courseId )
    BEGIN
        SELECT 'The student has not taken the course' AS ExecMessage
        RETURN
    END

    SET @sum = (SELECT SUM(grade) AS totalSum 
                    FROM Student
                    INNER JOIN WeeklySchedule ON Student.userId = WeeklySchedule.userId
                    INNER JOIN CourseGroup ON CourseGroup.courseGroupId = WeeklySchedule.courseGroupId
                    INNER JOIN Evaluation ON Evaluation.courseGroupId = CourseGroup.courseGroupId
                    INNER JOIN Item ON Item.evaluationId = Evaluation.evaluationId
                    INNER JOIN StudentXItem ON StudentXItem.itemId = Item.itemId AND StudentXItem.userId = Student.userId

                    WHERE Student.userId = @userId
					AND CourseGroup.courseId = @courseId) 

	SELECT @sum 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetLastPlan]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP GET LAST PLAN 
-- ENTRIES: userId, careerId
-- DESCRIPTION: Get the last career plan of a student
CREATE   PROCEDURE [dbo].[spGetLastPlan](@userId VARCHAR(32), @careerId INT) AS
BEGIN
    IF @userId IS NULL OR @careerId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Career WHERE careerId = @careerId)
    BEGIN
        SELECT 'The career does not exist' AS ExecMessage
        RETURN
    END
	IF NOT EXISTS(SELECT * FROM CareerXUser WHERE CareerXUser.careerId = @careerId AND CareerXUser.userId = @userId)
	BEGIN
		SELECT 'The student is not from this career' AS ExecMessage
        RETURN
	END
    SELECT TOP 1 userId,planId, CareerPlan.careerId FROM CareerPlan INNER JOIN CareerXUser ON CareerPlan.careerId = CareerXUser.careerId
        WHERE CareerPlan.careerId = @careerId AND userId = @userId ORDER BY activationDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetLatestFileVersion]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SP GET LATESTS FILE VERSION
-- ENTRIES: userId, fileId
-- DESCRIPTION: Gets the latest version of a file
CREATE   PROCEDURE [dbo].[spGetLatestFileVersion](@userId VARCHAR(32), @fileName VARCHAR(70)) AS
BEGIN
    IF @userId IS NULL OR @fileName IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM File_ WHERE name = @fileName)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        RETURN
    END

	DECLARE @fileId INT
	SET @fileId = (SELECT fileId FROM File_ WHERE name = @fileName)

    SELECT TOP 1 Version.filename FROM Version INNER JOIN File_ ON File_.fileId = Version.fileId WHERE userId = @userId AND File_.fileId = @fileId ORDER BY modificationDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetVersionOfFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- GET VERSION OF FILE
-- ENTRIES: userId, fileId, modificationDate
-- DESCRIPTION: Gets the version of a file in a specific date
CREATE   PROCEDURE [dbo].[spGetVersionOfFile](@userId VARCHAR(32), @fileId INT, @modificationDate DATE) AS
BEGIN
    IF @userId IS NULL OR @fileId IS NULL OR @modificationDate IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM File_ WHERE fileId = @fileId)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Version WHERE fileId = @fileId AND modificationDate = @modificationDate)
    BEGIN
        SELECT 'The version does not exist' AS ExecMessage
        RETURN
    END

    SELECT filename FROM Version WHERE fileId = @fileId AND modificationDate = @modificationDate
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertEnrollmentXStudent]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spInsertEnrollmentXStudent](@enrollmentId INT, @schoolPeriodId INT, @userId VARCHAR(32), @enrollmentTime TIME) AS
BEGIN
	DECLARE @time INT
	SET @time = DATEPART(HOUR, @enrollmentTime)
    IF @enrollmentId IS NULL OR @userId IS NULL OR @time IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Enrollment WHERE enrollmentId = @enrollmentId)
    BEGIN
        SELECT 'The enrollment does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF @time <= 0
    BEGIN
        SELECT 'The time must be greater than 0' AS ExecMessage
        RETURN
    END
	IF EXISTS(SELECT * FROM EnrollmentXStudent WHERE userId = @userId AND enrollmentId = @enrollmentId)
    BEGIN
        SELECT 'The student is already enrolled in this enrollment' AS ExecMessage
        RETURN
    END

    INSERT INTO EnrollmentXStudent(enrollmentTime, userId, enrollmentId) VALUES(@enrollmentTime, @userId, @enrollmentId)
END
GO
/****** Object:  StoredProcedure [dbo].[spMeetRequirements]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SP STUDENT MEETS ALL REQUIREMENTS TO ENROLL THE COURSE
-- ENTRIES: @userId VARCHAR(32), @courseId INT, @meetsRequirements BIT OUTPUT
-- Description: This procedure return if a student meets all requirements to enroll a course
CREATE   PROCEDURE [dbo].[spMeetRequirements](@userId VARCHAR(32), @courseId INT, @meetsRequirements BIT OUTPUT) AS
BEGIN

    IF @userId IS NULL OR @courseId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Course WHERE courseId = @courseId)
    BEGIN
        SELECT 'The course does not exist' AS ExecMessage
        RETURN
    END

    CREATE TABLE #TCourseRequirement (
    courseRequirementId INT,
    courseId INT,
    courseXPlanId INT
    )


    INSERT INTO #TCourseRequirement (courseRequirementId, courseId, courseXPlanId)
    SELECT courseRequirementId, courseId, courseXPlanId
    FROM CourseRequirement
    WHERE courseXPlanId = (SELECT courseXPlanId FROM CourseXPlan WHERE courseId = @courseId)

    -- SELECT * FROM #TCourseRequirement

    WHILE (SELECT COUNT(*) FROM #TCourseRequirement) != 0
    BEGIN

    IF (SELECT TOP(1) StudentXCourse.status FROM StudentXCourse INNER JOIN CourseXPlan ON CourseXPlan.courseId = StudentXCourse.courseId INNER JOIN CourseRequirement ON CourseXPlan.courseXPlanId = CourseRequirement.courseXPlanId INNER JOIN Course ON Course.courseId = CourseXPlan.courseId WHERE Course.courseId = @courseId) = 0
    BEGIN
        SET @meetsRequirements = 0
        --SELECT @meetsRequirements
        RETURN
    END

    DELETE TOP(1) FROM #TCourseRequirement


    END

    DROP TABLE #TCourseRequirement

    SET @meetsRequirements = 1
    --SELECT @meetsRequirements

END
GO
/****** Object:  StoredProcedure [dbo].[spModifyFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP MODIFY FILE (NEW VERSION)
-- ENTRIES: userId, fileId, modificationDate, name, description
-- DESCRIPTION: Modifies a file (creates a new version)
CREATE   PROCEDURE [dbo].[spModifyFile](@userId VARCHAR(32), @name VARCHAR(70), @filename VARCHAR(15)) AS
BEGIN

    IF @userId IS NULL OR @name IS NULL OR @filename IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END

    DECLARE @FileId INT
    SET @FileId = (SELECT fileId from File_ WHERE name = @name)

    DECLARE @modificationDate DATETIME
    SET @modificationDate = GETDATE()

    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM File_ WHERE fileId = @fileId)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM File_ WHERE fileId = @fileId AND userId = @userId)
    BEGIN
        SELECT 'The user does not own the file' AS ExecMessage
        RETURN
    END

    INSERT INTO Version (fileId, modificationDate, filename) VALUES (@fileId, @modificationDate, @filename)

END
GO
/****** Object:  StoredProcedure [dbo].[spReadFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- READ
-- ENTRIES: fileId
-- DESCRIPTION: Returns the info of all files
CREATE   PROCEDURE [dbo].[spReadFile] AS
BEGIN

    SELECT fileId, userId, fileTypeId, periodId, creationDate, name, description FROM File_
    
END
GO
/****** Object:  StoredProcedure [dbo].[spReadSchoolPeriod]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------------------
----------------------------------------- REQUIRED INFO SP ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- SP READ SCHOOL PERIOD
-- ENTRIES: @schoolPeriodId INT
-- Description: This procedure return all the data of a school period
CREATE   PROCEDURE [dbo].[spReadSchoolPeriod](@schoolPeriodId INT) AS
BEGIN
    IF @schoolPeriodId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM SchoolPeriod WHERE schoolPeriodId = @schoolPeriodId)
    BEGIN
        SELECT 'The school period does not exist' AS ExecMessage
        RETURN
    END
    SELECT schoolPeriodId, periodTypeId, startDate, endDate, statusId 
    FROM SchoolPeriod WHERE schoolPeriodId = @schoolPeriodId
END
GO
/****** Object:  StoredProcedure [dbo].[spReadUser_]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- READ
-- Entries: userId
-- Description: Gets the information of a user
CREATE   PROCEDURE [dbo].[spReadUser_](@userId VARCHAR(32)) AS
BEGIN
    IF @userId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END

    SELECT userId, userName, birthDate, email FROM User_ WHERE userId = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[spUnregister]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spUnregister](@userId VARCHAR(32), @courseGroupId INT) AS
BEGIN
	DECLARE @courseGroupPeriodId INT, @enrollmentId INT

	SET @courseGroupPeriodId = (SELECT periodId FROM CourseGroup WHERE courseGroupId = @courseGroupId)

	SET @enrollmentId = (SELECT TOP(1) enrollmentId FROM Enrollment ORDER BY enrollmentId DESC)

    IF @userId IS NULL OR @courseGroupId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM CourseGroup WHERE courseGroupId = @courseGroupId)
    BEGIN
        SELECT 'The course group does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM WeeklySchedule WHERE userId = @userId AND courseGroupId = @courseGroupId)
    BEGIN
        SELECT 'The user is not enrolled' AS ExecMessage
        RETURN
    END

    DELETE FROM WeeklySchedule WHERE userId = @userId AND courseGroupId = @courseGroupId

	IF NOT EXISTS(SELECT * FROM WeeklySchedule INNER JOIN CourseGroup ON CourseGroup.courseGroupId = WeeklySchedule.courseGroupId WHERE userId = @userId and periodId = @courseGroupPeriodId)
	BEGIN
		DELETE FROM EnrollmentXStudent WHERE userId = @userId AND enrollmentId = @enrollmentId
	END
	
    SELECT 'User unregistered succesfully' AS ExecMessage
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateFile]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spUpdateFile](@fileId INT, @fileTypeId INT, @periodId INT, @creationDate DATE, @name VARCHAR(70), @description VARCHAR(100), @error INT OUTPUT) AS
BEGIN
    IF @fileId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        SET @error = 1
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM File_ WHERE fileId = @fileId)
    BEGIN
        SELECT 'The file does not exist' AS ExecMessage
        SET @error = 1
        RETURN
    END
    IF @fileTypeId IS NOT NULL AND NOT EXISTS(SELECT * FROM FileType WHERE fileTypeId = @fileTypeId)
    BEGIN
        SELECT 'The file type does not exist' AS ExecMessage
        SET @error = 1
        RETURN
    END
    IF @periodId IS NOT NULL AND NOT EXISTS(SELECT * FROM SchoolPeriod WHERE schoolPeriodId = @periodId)
    BEGIN
        SELECT 'The period does not exist' AS ExecMessage
        SET @error = 1
        RETURN
    END

    UPDATE File_ SET fileTypeId = ISNULL(@fileTypeId, fileTypeId), periodId = ISNULL(@periodId, periodId), creationDate = ISNULL(@creationDate, creationDate), name = ISNULL(@name, name), description = ISNULL(@description, description) WHERE fileId = @fileId
    SET @error = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUser_]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- UPDATE
-- Entries: userId, userName, birthDate, email, idCampus
-- Description: Updates the information of a user
CREATE   PROCEDURE [dbo].[spUpdateUser_](@userId VARCHAR(32), @userName VARCHAR(50), @birthDate DATETIME, @email VARCHAR(50), @idCampus INT) AS
BEGIN
    IF @userId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM Campus WHERE campusId = @idCampus)
    BEGIN
        SELECT 'The campus does not exist' AS ExecMessage
        RETURN
    END

    UPDATE User_ SET userName = ISNULL(@userName, userName), birthDate = ISNULL(@birthDate, birthDate), email = ISNULL(@email, email) WHERE userId = @userId
    
    UPDATE CampusXUser SET campusId = ISNULL(@idCampus, campusId) WHERE userId = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[spVerifyCareer]    Script Date: 30/4/2023 11:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP VERIFY CAREER
-- ENTRIES: userId
-- DESCRIPTION: Check if the user has a career
CREATE   PROCEDURE [dbo].[spVerifyCareer] (@userId VARCHAR(32), @statusResult BIT OUTPUT) AS
BEGIN

    IF @userId IS NULL
    BEGIN
        SELECT 'NULL parameters' AS ExecMessage
        RETURN
    END
    IF NOT EXISTS(SELECT * FROM User_ WHERE User_.userId = @userId)
    BEGIN
        SELECT 'The user does not exist' AS ExecMessage
        RETURN
    END

    IF EXISTS(SELECT * FROM User_ INNER JOIN CareerXUser ON User_.userId = CareerXUser.userId WHERE User_.userId = @userId)
    BEGIN
        SELECT 'The user has a career' AS ExecMessage
        SET @statusResult = 1
        RETURN
    END
    ELSE
    BEGIN
        SET @statusResult = 0
        SELECT 'The user does not have a career' AS ExecMessage
        RETURN
    END
END
GO
ALTER DATABASE [db01] SET  READ_WRITE 
GO
