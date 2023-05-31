# Get Started with the Course
## Intro
Let's compare the role of a data professional to an archaeologist, highlighting the thrill of uncovering "hidden stories" from data. Robb, a Consumer Product marketing leader at Google, underlines the importance of storytelling in conveying insights derived from data analysis.

The course content includes exploratory data analysis, a six-part process that helps uncover stories within data, and the application of the PACE workflow (Plan, Analyze, Construct, Execute) in this context. It emphasizes the significance of data visualizations in understanding data and teaching you how to perform exploratory data analysis in Python.

The course will also tackle data sources, data types, data structuring, and data cleaning. It discusses handling missing values, outliers, and categorical data using Python notebooks. It stresses the ethics involved in exploring and cleaning raw data and effective communication of questions and findings to diverse audiences.

You'll learn more about Tableau, a visual analytics platform, and how to use it to enhance your data stories. The course promises to impart Google's essential data professional skills, including finding and telling stories with data, tailoring these narratives to different audiences, and building targeted data visualizations.

Robb shares a personal anecdote about his start as a data analyst for a healthcare consulting firm. By analyzing the medical records of millions of patients, he identified the most effective treatments, significantly improving patients' health outcomes, quality of life, and financial burdens. This story underscores the power of data-driven narratives.

![[Pasted image 20230531161258.png]]

## Exploratory Data Analysis (EDA)
The role of data professionals is likened to cleaning out and cataloguing the contents of an old warehouse. The process involves exploration and discovery, carried out through six main practices:

1. **Discovering**: Familiarize oneself with the data and ask pertinent questions about it, like understanding column headers or total data points.
    
2. **Structuring**: Organize raw data into a format that can be easily visualized or modeled. Avoid bias that can misrepresent the data during this stage.
    
3. **Cleaning**: Remove errors that could distort the data, such as missing values, misspellings, or extreme outliers.
    
4. **Joining**: Augment the data by adding values from other data sets to provide additional context or fill in gaps.
    
5. **Validating**: Ensure the data is consistent and high quality, checking for errors in spelling, format, and verifying that cleaning processes haven't introduced further errors.
    
6. **Presenting**: Share the cleaned data set or visualizations for further analysis or modeling. This can happen at any point during EDA, not necessarily at the end.
    

The practices of EDA do not necessarily follow a specific order and are often repeated iteratively.

### Importance of Ethical and Accessible Data

- The story revealed through EDA should come from the data itself and not from personal bias.
- Present data ethically and accessibly, ensuring accuracy and providing context to avoid misrepresentation.

### Analogy of the Warehouse

The analogy of the warehouse serves as an ongoing example of the EDA process, from initial discovery through to the final revelation of the warehouse's past as a storage for traveling food vendors.

# Case study: Deloitte

You’ve learned the definitions for each of the six practices of exploratory data analysis (EDA) — discovering, structuring, cleaning, joining, validating, and presenting. Next, you’ll discover how these practices apply to the data career space. In the following case study, members of Deloitte’s data team utilized the six practices of EDA to meet their client’s metrics and dashboarding needs. After you read more about the experiences of Deloitte’s team, you will have a tangible example of just how useful and empowering the application of these practices can be. 

![Deloitte logo](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/mD90klW7SdWs0Aiaise6tA_1bce5f92447843e49ca03c480ffc8af1_ADA_R-011Deloitte-Logo.png?expiry=1685664000000&hmac=zerDD9PCn6ZV8WG4CU2ST4CTj8-FZALTj1JX0APfcHI)

## Get to know Deloitte

[Deloitte](https://www2.deloitte.com/us/en.html) is an audit, consulting, tax, and advisory service. The company has over 100,000 employees and partners around the globe, and they work with many of the world’s biggest companies. Their services range from tax and accounting solutions to artificial intelligence and cyber security risk programs. 

![Deloitte homepage](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/SuDYn1VqS4yPXewVc99yLw_aa5f4e00547e440995d3ab867413f4f1_ADA_R-011_Deloitte-homepage.png?expiry=1685664000000&hmac=2rZnoMxKwyZmX-0r6O-7o7TIKgZ6rGTgRJ7dJmhm79Q)

The multinational corporation’s business to business (B2B) model keeps their focus on working with their customers on a number of strategic and financial fronts, according to their individual needs. [Deloitte provides a range of services for client projects](https://youtu.be/8Gg5BsFexOU?list=PLl4by_vVwv0zjE2FRD7BMwI2lpaMCAgHh), such as auditing, consulting, financial advisory, risk advisory, taxes, data analysis, and regulation. Since 2008, Deloitte has made it their vision to be the standard of excellence in professional business services. Because of this focus, Deloitte has remained at the forefront of technology advancements, including the deployment of real-time metrics for their clients. 

In just one of their many success stories,  Deloitte recently helped a billion-dollar cloud-based analytics and software company streamline the tracking and organization of their marketing leads and strategic analysis of their performance data. In this reading, you will see how Deloitte used EDA to analyze the client’s data in order to propose and apply a comprehensive solution they still use today.    

## The challenges 

![Photo showing an employee at work](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ojLXsLUBRLSrBOV1rXWVqQ_ed134e7d7f1245d19cca24c10da527f1_ADA_R-011_Deloitte-employee.png?expiry=1685664000000&hmac=DRgwoNxI_LWs1VbMGqJLzZb5YQgika4yzjI7ISonn0g)

One of Deloitte’s most important cloud-based software solution clients was facing a variety of challenges with their marketing and performance data. They asked Deloitte for help on all of them. Here are the specific challenges the client presented to Deloitte:  

- Difficulty in following up on marketing leads 
    
- Struggling to promptly track their marketing campaign performance
    
- A lack of personalized data dashboards displaying strategic company metrics
    

### **Following up on marketing leads** 

Deloitte’s client offers a range of cloud-based analysis services and software products to businesses around the globe, making it a monumental task to follow up on each of the thousands of inquiries and potential sales leads they receive on a monthly basis. As a result, Deloitte’s client was seeking a solution to help them more adequately track and act on these leads.   

### **Tracking marketing campaign performance** 

Relying on just four data analysts for analysis of marketing campaign performance for a $1B multinational corporation was quickly becoming unsustainable. Before Deloitte stepped in to help, the client’s performance tracking system was a series of data tables updated manually and kept in a spreadsheet tab. Each region kept their own performance data, creating issues of consistency and hours of wasted energy for the analysts who had to compile and merge the data to get a corporation-wide performance picture.  

### **Personalizing data dashboards** 

Because of differing needs for each level of management and varying marketing regions across the globe, the client needed to be able to easily parse and group data specific to their employees' needs across the corporation. Because they were working off of multiple spreadsheets across several different departments and locales, the client found they could not easily filter the data according to their needs, and therefore were not able to adequately shift strategy to improve performance. 

## The approach  

As Deloitte began working with their new client, they designed an approach that would meet each of their client’s proposed needs. Refer to the following PACE entries to review this approach in detail.

![Image shows the 4 steps of the PACE model: Plan, Analyze, Construct, and Execute.](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/kVQR7EBNQ_mwZXWCIihW9g_3d765180ccc94433969d8338d7131ff1_ADA_R-011_PACE-Model.png?expiry=1685664000000&hmac=mlKWFiLJY9cKh5iIqPu4ERBc0RWjI22_pV7rxQXj0R4)

## Plan 

To begin, Deloitte needed to meet with client stakeholders and help develop their vision for the future according to the three areas mentioned above: **Marketing leads, measuring marketing campaign performance,** and **personalizing data dashboards.** 

They needed to understand the client’s business by learning its processes, objectives and key results (OKRs), and how it approached and used its customer and potential customer data. 

Key project milestones were established early on, and adjusted according to any new knowledge acquired. Those milestones were: 

- Alignment with client on the future vision of data architecture and dashboards
    
- Establishment of the new data architecture
    
- Launch of descriptive and diagnostic tooling
    
- Launch of predictive models
    
- Training the global sales team on new tooling
    

Deloitte determined that their project plan would begin with the discovering, structuring, and cleaning practices of EDA on the client’s company-wide performance data.  

Deloitte quickly learned what OKRs the client wanted easy access to once the personalized dashboards were complete and set plans to achieve that outcome. Those OKRs came in the form of the following questions: 

- How much revenue was earned from a particular marketing campaign? 
    
- What industry, region, sector, and company size did the new customer fall into? 
    
- How long did it take to finalize the sale after the initial point of contact? 
    
- What was the success rate of different types of campaigns (i.e., in person events vs. online webinars)? 
    
- What was the average cost of marketing per customer gained?
    

## Analyze

As part of the framing of their initial analysis of the client’s data, it became clear the client was unfamiliar with Deloitte’s product services offerings, including assets like easy-to-use Tableau dashboard tooling. Because of this, the client’s assumptions and requests for what was possible fell far below Deloitte’s actual capability. This represented an opportunity to not only meet, but actually exceed the client’s expectations of the project. 

The first challenges of analysis were in understanding where the data was coming from and what each data variable meant. The client used non-standard naming conventions and definitions in their data, so Deloitte had to use discovering practices to learn their language to fully understand the client’s data and plan for how to help them use it. 

Deloitte found that the client’s approach to tracking performance at the time was clunky and overbroad at best. The performance data they gathered consisted of the use of overall averages to determine value of strategic company-wide actions. Without specific performance data per region, the company had no simple way of tracking regional performance.  

- As an example of the client’s overbroad data tracking at the time, this was the formula they used to derive the average revenue they gained per marketing campaign: 
    

�������� �������� �������� ������������ ���� �� ��������� ���������=������� ������� ������ ��� ��������Average cost of marketing campaignsAverages customer contract value​=Average revenue gained per campaign

Deloitte learned that the client’s internal marketing and sales teams were organized according to geographic regions, industries, and customer account size. Regional leads had the authority and autonomy to conduct marketing research and campaigns on their own, but did take guidance and occasional instruction from the global team. Deloitte’s analysts began structuring the data in a consistent way company wide as part of their EDA of the client’s data.

In terms of customer life cycle, Deloitte learned that the client’s marketing leads would generate marketing campaigns and then inform sales partners in their regions. Field sales representatives would follow up on all leads generated from the campaigns, and they would also network outside of existing campaigns to find additional customers. This discovering part of EDA informed Deloitte’s team on more specific and plausible solutions that could meet the client’s needs. 

The Deloitte team used discovering and structuring practices of EDA in spreadsheets to review all of the existing data from the client’s Salesforce and marketing campaigns. They began to identify and define every data variable that existed in their client’s sales system. Once an inventory of data variables was structured, cleaned, and validated, the Deloitte team brainstormed the type of insights they could glean from the information. 

After the review, Deloitte utilized the presenting practice of EDA to share the information they had gathered with the client. They listened and asked questions to get a better understanding of how the client viewed their own business and what factors were important to them according to the data.  

## Construct

From their analysis of the client’s systems and the discovering, structuring, and cleaning practices of EDA they did on the client’s performance data, Deloitte learned that the client needed a total overhaul of their analytical process; one that provided much greater detail and allowed them to identify and address bottlenecks, unprofitable campaigns, and unproductive customer segments.

With the client’s approval, Deloitte completely rebuilt the client’s data internal infrastructure from the ground up to make analysis more streamlined.  

On top of the infrastructure overhaul, the most hands-on solution for the client was to build customized and dynamic dashboards for specific stakeholders. 

- The Deloitte team worked with each client stakeholder group to understand their needs and their OKRs. 
    
- They then helped develop tailored solutions for the client by creating supporting collateral resources, such as a data dictionary to define what each variable represents and how it should and should not be used. 
    

Deloitte used the information they gathered from their client’s data to build automations and tools that performed predictive analysis on their OKRs. This allowed the client to establish feasible, but aggressive targets for the future.

## Execute

Deloitte’s overhaul of their client’s data infrastructure led to a streamlined, tiered approach to global data gathering. Where before the client was forced to rely on regionally gathered and inconsistently structured spreadsheets to formulate their performance metrics, they could now easily quantify everything from global, company-wide performance down to the performance of a regional team of sales team members on specific products and subset of clients.

After implementation of personalized dashboards, Senior VPs could filter the status and performance of the OKRs to the whole departments and regions for which they were responsible. Additionally, regional leads, marketing leads, and even local sales leads were able to view data filtered down to their applicable area. 

As part of implementation, Deloitte team members created training sessions according to their client’s needs across the organization—everything from how to use the personalized dashboards to how to maintain the new data infrastructure.  

The Deloitte-designed dashboards and data infrastructure instantly became valuable assets to multiple stakeholders across the client’s global team. 

**Note**: In their work with the client,Deloitte was not following the PACE workflow as it is listed above; rather, while documenting the details of their work into this case study, Deloitte’s work for the client has been organized according to the PACE workflow to demonstrate the versatility of its application. 

## Summarizing the results

When Deloitte started working with their new client, they were hesitant to trust the accuracy of the company’s existing data because of a lack of standardization between the marketing and sales teams. That lack of consistency made it difficult to associate any particular sale to a specific campaign. After a few weeks of studying the client’s sales and marketing processes and EDA of their data, Deloitte rebuilt the data infrastructure in a way that directly tied all sales to their applicable marketing campaigns. They tied these sales to marketing campaigns using primary keys aligned across a number of data tables that could be easily sorted. This gave the Deloitte analysts an idea of what was possible with the data and led them to building final products that exceeded what the client thought was initially possible.

Once the infrastructure was overhauled, Deloitte’s performance of EDA uncovered that the client was focusing too much effort on earning new clients, to the detriment of existing client relationships. While sales to new clients did increase because of the focus of OKRs, sales to their existing customers plummeted. This result was previously unknown to the client. As a result, the client was able to pivot their strategy by both sales region and product. The dynamic dashboards Deloitte created became the client’s most effective tool for measuring and tracking performance as well as setting strategy.  

## Conclusion

Because of Deloitte’s focus on the client’s business problem in both their assessment of the client’s business practices and EDA of their data, they were able to uncover truths previously hidden in unstructured data. Deloitte built interactive, dynamic data dashboards designed to filter down to any sales region or product in the company so that the client could discover these truths on their own in the future. The greatest benefit of these solutions was the client’s leadership and marketing leads became a much more agile team. They were better able to make effective business decisions that directly improved revenue. The data infrastructure overhaul and data dashboard solutions also helped improve the work-life balance of their analysts. All of these outcomes were notable for not only the client but also Deloitte because the client was and is a key partner and account for the firm. Because of their focus on the data, Deloitte was able to offer a solution that exceeded the client’s expectations and, in turn, helped them better serve their customers around the world.
