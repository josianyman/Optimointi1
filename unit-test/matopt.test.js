function Type1() {
    this.calculateSudentCost = function (studentCounts, studentSalary) {
        let cost = 0
        for (let i = 0; i < 6; i++) {
            cost += studentCounts[i] * studentSalary
        }
        return cost
    }

    this.calculateWorkingAgentCosts = function (studentCounts, requiredTeachersPerStudent, agentDemands, workingSalary) {
        let cost = 0
        for (let i = 0; i < 6; i++) {
            cost += (studentCounts[i] * requiredTeachersPerStudent + agentDemands[i]) * workingSalary
        }
        return cost
    }

    this.calculateIdleCosts = function (initialAgentCount, agentDemands, agentContinueNextMonthPercent, studentCounts, requiredTeachersPerStudent, studentPassPercent, idleSalary) {
        let idleCosts = 0
        for (let i = 0; i < 6; i++) {
            cost = 0
            cost += initialAgentCount * agentContinueNextMonthPercent ^ i
            cost -= studentCounts[i] * requiredTeachersPerStudent
            cost -= agentDemands[i]
            for (let j = 0; j < i - 1; j++) {
                cost += studentCounts[j] * studentPassPercent * agentContinueNextMonthPercent ^ (i - j - 1)
            }
            idleCosts += cost * idleSalary
        }
        return idleCosts
    }

    //! studentCounts.length and agentDemands.length must be 6
    this.calculateCost = function (studentCounts, salaries, agentDemands, initialAgentCount, studentPassPercent, agentContinueNextMonthPercent, requiredTeachersPerStudent) {

        return this.calculateSudentCost(studentCounts, salaries[0])
            + this.calculateWorkingAgentCosts(studentCounts, requiredTeachersPerStudent, agentDemands, salaries[1])
            + this.calculateIdleCosts(initialAgentCount, agentDemands, agentContinueNextMonthPercent, studentCounts, requiredTeachersPerStudent, studentPassPercent, salaries[2])
    }
}

test('Cost func 1 returns correct answers', () => {
    let res = new Type1().calculateCost([0, 38, 38, 7, 38, 0], [350, 600, 500], [135, 125, 150, 170, 160, 180], 145, 4 / 5, 0.92, 1 / 15)
    expect(res).toBe(607850)
})