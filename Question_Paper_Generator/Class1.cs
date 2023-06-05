using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Question_Paper_Generator
{
    public class Class1
    {
            static void Main(string[] args)
            {
                // Connection string for the database
                string connectionString = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";

                // Create connection and open it
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Retrieve questions from the "add question" table
                    SqlCommand command = new SqlCommand("SELECT * FROM Add_Question", connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable addQuestionTable = new DataTable();
                    adapter.Fill(addQuestionTable);

                    // Create two sets of unique questions
                    List<DataRow> questionList = new List<DataRow>(addQuestionTable.Select());
                    Random random = new Random();
                    List<DataRow> setA = new List<DataRow>();
                    List<DataRow> setB = new List<DataRow>();
                    while (setA.Count < 30 || setB.Count < 30)
                    {
                        int randomIndex = random.Next(questionList.Count);
                        DataRow question = questionList[randomIndex];
                        if (setA.Find(q => q["Question"].Equals(question["Question"])) == null)
                        {
                            if (setA.Count < 30)
                            {
                                setA.Add(question);
                            }
                            else if (setB.Find(q => q["Question"].Equals(question["Question"])) == null)
                            {
                                setB.Add(question);
                            }
                        }
                        else if (setB.Find(q => q["Question"].Equals(question["Question"])) == null)
                        {
                            if (setB.Count < 30)
                            {
                                setB.Add(question);
                            }
                        }
                        questionList.RemoveAt(randomIndex);
                    }

                    // Generate question papers using the details from the "paper details" table
                    command = new SqlCommand("SELECT * FROM createQP", connection);
                    adapter = new SqlDataAdapter(command);
                    DataTable paperDetailsTable = new DataTable();
                    adapter.Fill(paperDetailsTable);
                    foreach (DataRow paperDetails in paperDetailsTable.Rows)
                    {
                        string set = paperDetails["Set"].Equals("A") ? "Set A" : "Set B";
                        Console.WriteLine($"{paperDetails["Course"]} - Semester {paperDetails["Sem"]} - {set}");
                        Console.WriteLine($"Date: {paperDetails["Date"]} - Time: {paperDetails["Time"]}");
                        Console.WriteLine();

                        List<DataRow> questionSet = paperDetails["Set"].Equals("A") ? setA : setB;
                        int unitCount = 1;
                        foreach (DataRow question in questionSet)
                        {
                            if (Convert.ToInt32(question["Unit"]) == unitCount)
                            {
                                Console.WriteLine($"Unit {unitCount}: {question["Question"]}");
                                unitCount++;
                            }
                            if (unitCount > 5) break;
                        }
                        Console.WriteLine();
                    }
                }

                Console.ReadLine();
            }
        }
    }