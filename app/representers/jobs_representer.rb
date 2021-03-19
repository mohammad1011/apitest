class JobsRepresenter
    def initialize(jobs)
      @jobs = jobs
    end

    def as_json
      jobs.map do |job|
      {
        id: job.id,
        title: job.title,
        email: job.user.email

      }
      end
    end
    private
    attr_reader :jobs
end
