
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.EducationalRecordRepository;
import domain.EducationalRecord;
import domain.HandyWorker;

@Service
@Transactional
public class EducationalRecordService {

	//Managed repository
	@Autowired
	private EducationalRecordRepository	educationalRecordRepository;
	//Supporting repositories
	@Autowired
	private ActorService				actorService;
	@Autowired
	private HandyWorkerService			handyWorkerService;
	@Autowired
	private CurriculaService			curriculaService;


	//Simple CRUD methods
	public EducationalRecord create() {
		final EducationalRecord educationalRecord = new EducationalRecord();
		educationalRecord.setComments(new ArrayList<String>());
		return educationalRecord;
	}

	public Collection<EducationalRecord> findAll() {
		return this.educationalRecordRepository.findAll();
	}

	public EducationalRecord findOne(final int educationalRecordID) {
		return this.educationalRecordRepository.findOne(educationalRecordID);
	}

	public EducationalRecord save(final EducationalRecord educationalRecord) {
		final EducationalRecord result = this.educationalRecordRepository.save(educationalRecord);
		Assert.isNull(result);
		final HandyWorker hw = this.handyWorkerService.findOne(this.actorService.getActorLogged().getId());
		if (result.getId() == 0) {
			final List<EducationalRecord> eR = (List<EducationalRecord>) hw.getCurricula().getEducationalRecord();
			eR.add(result);
			hw.getCurricula().setEducationalRecord(eR);
			this.curriculaService.save(hw.getCurricula());
		} else {
			Assert.isTrue(hw.getCurricula().getEducationalRecord().contains(result));
			final List<EducationalRecord> eR = (List<EducationalRecord>) hw.getCurricula().getEducationalRecord();
			eR.add(result);
			hw.getCurricula().setEducationalRecord(eR);
			this.curriculaService.save(hw.getCurricula());
		}
		return result;
	}

	public void delete(final EducationalRecord educationalRecord) {
		Assert.isNull(educationalRecord);
		Assert.isTrue(educationalRecord.getId() == 0);
		this.educationalRecordRepository.delete(educationalRecord);
	}

	//Other business methods

}
