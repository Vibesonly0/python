<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anza Aleem | Software Engineer & Data Expert Portfolio</title>
    <style>
        /* Modern Minimalist Styling */
        :root {
            --primary-color: #2563eb; /* Professional Tech Blue */
            --text-dark: #1f2937;
            --text-light: #4b5563;
            --bg-light: #f9fafb;
            --white: #ffffff;
            --border-color: #e5e7eb;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Container Layout */
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Header / Hero Section */
        header {
            text-align: center;
            padding: 40px 0;
            border-bottom: 1px solid var(--border-color);
            background-color: var(--white);
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            margin-bottom: 40px;
        }

        .profile-title {
            font-size: 2.5rem;
            color: var(--text-dark);
            margin-bottom: 5px;
            font-weight: 700;
        }

        .profile-subtitle {
            font-size: 1.25rem;
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 15px;
        }

        .bio {
            max-width: 700px;
            margin: 0 auto 20px auto;
            color: var(--text-light);
            font-size: 1.05rem;
            padding: 0 15px;
        }

        .contact-info {
            font-size: 0.95rem;
            color: var(--text-light);
        }

        .contact-info a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        /* Two Column Layout for Main Content */
        .main-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
        }

        @media (max-width: 768px) {
            .main-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Section Cards */
        section {
            background-color: var(--white);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            border: 1px solid var(--border-color);
        }

        h2 {
            font-size: 1.5rem;
            color: var(--text-dark);
            margin-bottom: 20px;
            border-left: 4px solid var(--primary-color);
            padding-left: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Timeline Items (Experience & Education) */
        .timeline-item {
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border-color);
        }

        .timeline-item:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        .timeline-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
            margin-bottom: 8px;
        }

        .role-title {
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--text-dark);
        }

        .company-name {
            font-size: 1rem;
            color: var(--primary-color);
            font-weight: 500;
        }

        .date-badge {
            font-size: 0.85rem;
            background-color: #eff6ff;
            color: var(--primary-color);
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 600;
        }

        ul {
            list-style-position: inside;
            padding-left: 5px;
            color: var(--text-light);
        }

        li {
            margin-bottom: 6px;
            font-size: 0.95rem;
        }

        /* Project Cards */
        .project-card {
            background: #fafafa;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .project-card:last-child {
            margin-bottom: 0;
        }

        .project-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 5px;
        }

        /* Skill Tags */
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .skill-tag {
            background-color: #f3f4f6;
            color: var(--text-dark);
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 0.9rem;
            font-weight: 500;
            border: 1px solid var(--border-color);
        }

        /* Score Badge */
        .score {
            font-weight: bold;
            color: var(--text-dark);
        }
    </style>
</head>
<body>

    <div class="container">
        
        <header>
            <h1 class="profile-title">Anza Aleem</h1>
            <p class="profile-subtitle">Software Engineer & Data Solutions Specialist</p>
            <p class="bio">
                Passionate about developing innovative software solutions and high-performance applications. 
                Combining technical academic software development expertise with years of hands-on, self-employed 
                experience delivering digital solutions, clean database operations, and strategic lead generation campaigns.
            </p>
            <div class="contact-info">
                <span>📍 Pakistan</span> &nbsp;|&nbsp; 
                <span>✉️ <a href="mailto:anzaaleem1122@gmail.com">anzaaleem1122@gmail.com</a></span>
            </div>
        </header>

        <div class="main-grid">
            
            <div class="left-column">
                
                <section id="experience">
                    <h2>Work Experience</h2>
                    
                    <div class="timeline-item">
                        <div class="timeline-header">
                            <div>
                                <div class="role-title">Freelancer</div>
                                <div class="company-name">Self-Employed</div>
                            </div>
                            <span class="date-badge">Apr 2023 - Present</span>
                        </div>
                        <ul>
                            <li>Managed comprehensive document operations and high-accuracy data entry tasks.</li>
                            <li>Conducted targeted B2B lead generation initiatives and optimized email outreach campaigns.</li>
                            <li>Created engaging, high-quality technical and informative content for Blogspot platforms.</li>
                        </ul>
                    </div>

                    <div class="timeline-item">
                        <div class="timeline-header">
                            <div>
                                <div class="role-title">Student Intern</div>
                                <div class="company-name">Various Technical Projects</div>
                            </div>
                            <span class="date-badge">Sep 2022 - Mar 2023</span>
                        </div>
                        <ul>
                            <li>Developed cross-platform software applications within competitive academic environments.</li>
                            <li>Collaborated seamlessly on team-centric technical projects and agile presentations.</li>
                            <li>Consistently enhanced technical logic and architecture fundamentals through practical coursework.</li>
                        </ul>
                    </div>
                </section>

                <section id="projects">
                    <h2>Featured Engineering Projects</h2>
                    
                    <div class="project-card">
                        <div class="project-title">Healthcare Application with Database Integration</div>
                        <p style="color: var(--text-light); font-size: 0.95rem; margin-bottom: 10px;">
                            Designed and engineered a practical medical management application focusing on structural database mechanics. 
                            Features full SQL integration for secure user data handling, storage, and real-time query operations.
                        </p>
                        <div class="skills-container" style="margin-top: 5px;">
                            <span class="skill-tag" style="font-size: 0.8rem; padding: 3px 8px;">SQL</span>
                            <span class="skill-tag" style="font-size: 0.8rem; padding: 3px 8px;">Database Management</span>
                            <span class="skill-tag" style="font-size: 0.8rem; padding: 3px 8px;">GUI Development</span>
                        </div>
                    </div>

                    <div class="project-card">
                        <div class="project-title">Interactive Desktop Game Architecture</div>
                        <p style="color: var(--text-light); font-size: 0.95rem; margin-bottom: 10px;">
                            Programmed a dynamic, fully interactive desktop game emphasizing clean Object-Oriented Design (OOD) practices. 
                            Built structural frame mechanics, responsive event listeners, and intuitive gameplay loops.
                        </p>
                        <div class="skills-container" style="margin-top: 5px;">
                            <span class="skill-tag" style="font-size: 0.8rem; padding: 3px 8px;">Java</span>
                            <span class="skill-tag" style="font-size: 0.8rem; padding: 3px 8px;">OOP</span>
                            <span class="skill-tag" style="font-size: 0.8rem; padding: 3px 8px;">GUI Development</span>
                        </div>
                    </div>
                </section>
            </div>

            <div class="right-column">
                
                <section id="skills">
                    <h2>Technical Skills</h2>
                    <div class="skills-container">
                        <span class="skill-tag">Python</span>
                        <span class="skill-tag">Java</span>
                        <span class="skill-tag">SQL</span>
                        <span class="skill-tag">HTML</span>
                        <span class="skill-tag">CSS</span>
                        <span class="skill-tag">Tkinter</span>
                        <span class="skill-tag">GUI Development</span>
                        <span class="skill-tag">MS Office</span>
                        <span class="skill-tag">Lead Generation</span>
                        <span class="skill-tag">Data Entry</span>
                    </div>
                </section>

                <section id="education">
                    <h2>Education</h2>
                    
                    <div class="timeline-item">
                        <div class="role-title" style="font-size: 1.05rem;">Bachelor of Software Engineering</div>
                        <div class="company-name" style="font-size: 0.95rem; margin-bottom: 5px;">Islamia University of Bahawalpur</div>
                        <div class="date-badge" style="display: inline-block; margin-bottom: 10px;">Graduation: 2028</div>
                        <p style="font-size: 0.9rem; color: var(--text-light);">
                            Achieved Academic <span class="score">CGPA of 3.27</span>. Actively participating in software development sprints and technical architecture projects.
                        </p>
                    </div>

                    <div class="timeline-item" style="border: none; margin-bottom: 0; padding-bottom: 0;">
                        <div class="role-title" style="font-size: 1.05rem;">Intermediate (Pre-Engineering)</div>
                        <div class="company-name" style="font-size: 0.95rem; margin-bottom: 5px;">Cadet College for Girls, SBA</div>
                        <div class="date-badge" style="display: inline-block; margin-bottom: 10px;">Class of 2023</div>
                        <p style="font-size: 0.9rem; color: var(--text-light);">
                            Completed higher secondary education, securing a distinguished academic score of <span class="score">80% in FSc</span>.
                        </p>
                    </div>
                </section>

                <section id="achievements">
                    <h2>Key Achievements</h2>
                    <ul>
                        <li>Successfully executed cross-functional professional freelance contracts over multiple years.</li>
                        <li>Maintained a highly competitive 3.27 CGPA in software engineering core disciplines.</li>
                        <li>Engineered full database-integrated system apps within academic project guidelines.</li>
                    </ul>
                </section>
                
            </div>
            
        </div>
    </div>

</body>
</html>